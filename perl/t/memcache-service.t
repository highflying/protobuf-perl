#!/usr/bin/perl

use Test::More tests => 1;
use Protobuf;
use FindBin qw($Bin);
use lib "$Bin/autogen";

use_ok("Memcache");

# build up a get request
{
    my $get = MemcacheGetRequest->new;
    is($get->serialize_to_string, "");
    $get->add_key("foo");
    $get->add_key("bar");
    is($get->keys->[0], "foo");
    is($get->keys->[1], "bar");
    is($get->key_size, 2);
    is($get->serialize_to_string, "\n\x03foo\n\x03bar");
}

# build up a get response
{
    my $it;
    my $getres = MemcacheGetResponse->new;
    $it = $getres->add_item; # creates new item and appends it
    $it->set_key("foo");
    $it->set_value("VALUE_OF_FOO");
    $it->set_flags(123);
    is($getres->serialize_to_string,
       "\x0b\x12\x03foo\x1a\x0cVALUE_OF_FOO%{\x00\x00\x00\x0c");
}


# build up a set request
{
    my $it;
    my $setreq = MemcacheSetRequest->new;
    $it = $setreq->add_item; # creates new item and appends it
    $it->set_key("foo");
    $it->set_value("FOO_VALUE");
    $it->set_expiration_time(255);
    is($setreq->serialize_to_string,
       "\x0b\x12\x03foo\x1a\tFOO_VALUE5\xff\x00\x00\x00\x0c");
    # set
    $it->set_set_policy(MemcacheSetRequest::SetPolicy::SET);
    is($setreq->serialize_to_string,
       "\x0b\x12\x03foo\x1a\tFOO_VALUE(\x015\xff\x00\x00\x00\x0c");
    # add
    $it->set_set_policy(MemcacheSetRequest::SetPolicy::ADD);
    is($setreq->serialize_to_string,
       "\x0b\x12\x03foo\x1a\tFOO_VALUE(\x025\xff\x00\x00\x00\x0c");
}

# build up a set response
{
    my $sres = MemcacheSetResponse->new;
    $sres->add_set_status(1);
    $sres->add_set_status(2);
    $sres->add_set_status(3);
    $sres->add_set_status(250);
    is($sres->serialize_to_string,
       "\x08\x01\x08\x02\x08\x03\x08\xfa\x01");
}
