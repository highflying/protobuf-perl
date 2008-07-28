package Protobuf::Encoder;
use Moose;

use Protobuf::Types;
use utf8 ();

sub encode_wire {
    my ( $self, $field, $wire, $data ) = @_;
    my $wire_name = lc(wire_type_name($wire));
    my $method = "encode_wire_${wire_name}";
    $self->$method($field, $data);
}

sub encode_field_and_wire_type {
    my ( $self, $field, $wire ) = @_;
    die "bad field value, must be int" unless $field == int($field);
    die "bad wire value" unless ($wire & 7) == int($wire);
    $self->encode_varint( ( $field << 3 ) | $wire );
}

sub encode_varint {
    my ( $self, $int ) = @_;

    my $buf = '';

    die "varint must be unsigned" if $int < 0;
    die "value is not an int" unless $int == int($int); # FIXME too pedantic?

    while ( $int > 127 ) {
        $buf .= chr( ($int & 0x7f) | 0x80 );
        $int >>= 7;
    }
    return $buf . chr($int);
}

sub encode_length_delimited {
    my ( $self, $buf ) = @_;

    die "unexpected utf8 bytes, should be octets" if utf8::is_utf8($buf); # FIXME what's the correct behavior? at any rate length() needs to be per byte

    return ( $self->encode_varint(length($buf)) . $buf );

    # pack("W/a*")
}

sub encode_wire_fixed_32 {
    my ( $self, $field, $buf ) = @_;
    die "value must be a 4 octet bytes" if utf8::is_utf8($buf) || length($buf) != 4;
    $self->encode_field_and_wire_type($field, WIRE_FIXED32) . $buf;
}

sub encode_wire_fixed_64 {
    my ( $self, $field, $buf ) = @_;
    die "value must be an 8 octet bytes" if utf8::is_utf8($buf) || length($buf) != 8;
    $self->encode_field_and_wire_type($field, WIRE_FIXED64) . $buf;
}

sub encode_wire_varint {
    my ( $self, $field, $int ) = @_;
    $self->encode_field_and_wire_type($field, WIRE_VARINT) . $self->encode_varint($int);
}

sub encode_wire_length_delimited {
    my ( $self, $field, $bytes ) = @_;
    $self->encode_field_and_wire_type($field, WIRE_LENGTH_DELIMITED) . $self->encode_length_delimited($bytes);
}

sub encode_wire_start_group {
    my ( $self, $field ) = @_;
    $self->encode_field_and_wire_type($field, WIRE_START_GROUP);
}

sub encode_wire_end_group {
    my ( $self, $field ) = @_;
    $self->encode_field_and_wire_type($field, WIRE_END_GROUP);
}

__PACKAGE__

__END__