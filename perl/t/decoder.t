#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 36;

use lib "t/lib";
use Test::Protobuf;

use FindBin qw($Bin);
use lib "$Bin/autogen";

no utf8;

use_ok("Protobuf::Decoder");
use Data::Dumper;
my $events;

ok($events = Protobuf::Decoder->decode("\x08\x96\x01"));
is(scalar @$events, 1);
is($events->[0]{value}, 150);
is($events->[0]{fieldnum}, 1);

ok($events = Protobuf::Decoder->decode("\x08\x80\x80\x01"));
is(scalar @$events, 1);
is($events->[0]{value}, 16384);
is($events->[0]{fieldnum}, 1);

ok($events = Protobuf::Decoder->decode("\x12\x07\x74\x65\x73\x74\x69\x6e\x67"));
is(scalar @$events, 1);
is($events->[0]{value}, "testing");
is($events->[0]{fieldnum}, 2);

ok($events = Protobuf::Decoder->decode("\x82\x08\x07\x74\x65\x73\x74\x69\x6e\x67"));
is(scalar @$events, 1);
is($events->[0]{value}, "testing");
is($events->[0]{fieldnum}, 128);

ok( !utf8::is_utf8($events->[0]{value}), "utf8 bit is off" );

# and both tests above, together:
ok($events = Protobuf::Decoder->decode(
       "\x12\x07\x74\x65\x73\x74\x69\x6e\x67" .
       "\x08\x96\x01"));
is(scalar @$events, 2);
is($events->[0]{value}, "testing");
is($events->[0]{fieldnum}, 2);
is($events->[1]{value}, 150);
is($events->[1]{fieldnum}, 1);

# memcache get request
ok($events = Protobuf::Decoder->decode("\n\x03foo\n\x03bar"));
is(scalar @$events, 2);
is($events->[0]{value}, "foo");
is($events->[0]{fieldnum}, 1);
is($events->[1]{value}, "bar");
is($events->[1]{fieldnum}, 1);

# groups.  memcache get response.  (deprecated, but used in app engine
# because they're from proto1 originally)
ok($events = Protobuf::Decoder->decode(
       "\x0b\x12\x03foo\x1a\x0cVALUE_OF_FOO%{\x00\x00\x00\x0c"));
is_deeply($events,
          [
           {
               'fieldnum' => 1,
               'type' => 'start_group'
           },
           {
               'value' => 'foo',
               'fieldnum' => 2
           },
           {
               'value' => 'VALUE_OF_FOO',
               'fieldnum' => 3
           },
           {
               'value' => "{\x00\x00\x00",
               'fieldnum' => 4
           },
           {
               'fieldnum' => 1,
               'type' => 'end_group'
           }
          ], "MemcacheGetResponse - w/ groups");

# groups.  memcache set request.
ok($events = Protobuf::Decoder->decode(
       "\x0b\x12\x03foo\x1a\tFOO_VALUE(\x015\xff\x00\x00\x00\x0c"));
is_deeply($events, 
          [
           {
               'fieldnum' => 1,
               'type' => 'start_group'
           },
           {
               'value' => 'foo',
               'fieldnum' => 2
           },
           {
               'value' => 'FOO_VALUE',
               'fieldnum' => 3
           },
           {
               'value' => 1,
               'fieldnum' => 5
           },
           {
               'value' => "\xff\x00\x00\x00",
               'fieldnum' => 6
           },
           {
               'fieldnum' => 1,
               'type' => 'end_group'
           }
          ], "MemcacheSetRequest - w/ groups");

# MemcacheSetResponse
ok($events = Protobuf::Decoder->decode(
       "\x08\x01\x08\x02\x08\x03\x08\xfa\x01"));
is_deeply($events, 
          [
           {
             'value' => 1,
             'fieldnum' => 1
           },
           {
             'value' => 2,
             'fieldnum' => 1
           },
           {
             'value' => 3,
             'fieldnum' => 1
           },
           {
             'value' => 250,
             'fieldnum' => 1
          }
          ], "MemcacheSetResponse");

sub dump_events {
    diag(escaped(Dumper($events)));
}

