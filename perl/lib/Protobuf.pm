package Protobuf;
use strict;

our $VERSION = '0.01';

package Protobuf::EnumDescriptor;

use Moose::Policy 'Protobuf::AccessorNamingPolicy';
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'fullname' => (is => 'rw', isa => 'Str');

has 'values' => (is => 'rw', isa => 'ArrayRef[Protobuf::EnumValueDescriptor]' );

package Protobuf::EnumValueDescriptor;

use Moose::Policy 'Protobuf::AccessorNamingPolicy';
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'index' => (is => 'rw', isa => 'Int');
has 'number' => (is => 'rw', isa => 'Int');
has 'type' => (is => 'rw', isa => 'Maybe[Protobuf::EnumDescriptor]');

package Protobuf::MessageOptions;
use Moose;

package Protobuf::Descriptor;
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'full_name' => (is => 'rw', isa => 'Str');
has 'fields' => (is => 'rw', isa => 'ArrayRef[Protobuf::FieldDescriptor]');

sub class_name {
    my $self = shift;
    my $name = $self->full_name;
    $name =~ s/^appengine_api\.//; # TODO(bradfitz): Hack. temporary.
    $name =~ s/\./::/g;
    return $name;
}

sub fields_by_name {
    my ($self, $field_name) = @_;
    for my $field (@{ $self->fields }) {
        if ($field->name eq $field_name) {
            return $field;
        }
    }
    return undef;
}

package Protobuf::FieldDescriptor;
use Moose::Policy 'Protobuf::AccessorNamingPolicy';
use Moose;

has [qw(index number)] => (is => 'rw', isa => 'Int');
has 'name' => (is => 'rw', isa => 'Str');
has 'message_type' => (is => 'rw', isa => 'Maybe[Protobuf::Descriptor]');
has 'enum_type' => (is => 'rw', isa => 'Maybe[Protobuf::EnumDescriptor]');

# can be arrayref (?), int, string, ...
has 'default_value' => (is => 'rw', isa => 'Any');

# label can be 1 (optional), 2 (required), 3 (repeated)
has 'label' => (is => 'rw', isa => 'Int'); # TODO(bradfitz): but only 1, 2, or 3.

has 'type' => (is => 'rw', isa => 'Int'); # TODO(bradfitz): but only [1,18]. see descriptor.proto

has 'default_value' => ( is => 'rw' );

sub is_repeated {
    my $self = shift;
    return $self->label == 3;
}

sub is_optional {
    my $self = shift;
    return $self->label == 1;
}

sub is_required {
    my $self = shift;
    return $self->label == 2;
}

sub is_aggregate {
    my $self = shift;
    my $type = $self->type;
    # values from descriptor.proto: (TYPE_GROUP and TYPE_MESSAGE)
    # http://protobuf.googlecode.com/svn/trunk/src/google/protobuf/descriptor.proto
    return $type == 10 || $type == 11;
}

package Protobuf::Message;
use strict;

use Protobuf::Attribute::Field::Repeated;
use Protobuf::Attribute::Field::Scalar;
use Protobuf::Encoder;
use Moose::Util::TypeConstraints;

# 5.8 doesn't have this: -brad
# use namespace::clean;

sub GenerateClass {
    my ($class, $name, $descriptor) = @_;

    my %methods;
    $methods{new} = sub {
        my ($class, %param) = @_;
        return $class->meta->new_object(%param);
    };

    $methods{serialize_to_string} = sub {
        my $self = shift;
        my $fields_ref = $descriptor->fields;
        return Protobuf::Message::serialize_to_string($self, $fields_ref);
    };

    my @attributes;

    foreach my $field ( @{ $descriptor->fields } ) {
        my $type_constraint;

        if ( my $message_desc = $field->message_type ) {
            $type_constraint = class_type($message_desc->class_name);
        }

        if ( my $enum = $field->enum_type) {
            # create FIXME type constraint (range check)
            foreach my $value ( @{ $enum->values } ) {
                my $fqname = join("::", $name, $enum->name, $value->name);
                my $number = $value->number;
                no strict 'refs';
                *$fqname = sub () { $number };
            }
        }

        push @attributes, Moose::Meta::Attribute->interpolate_class_and_new( $field->name => (
            traits => [ 'Protobuf::Field::' . ( $field->is_repeated ? 'Repeated' : 'Scalar' ) ],
            field => $field,
            type_constraint => $type_constraint,
        ));

    }

    my $c = Moose::Meta::Class->create(
        $name => (
            superclasses => ['Protobuf::Message'],
            attributes => \@attributes,
            methods => \%methods,
        ));
}

# each auto-generated class overrides serialize_to_string just to
# capture its field list and pass it to us here.
sub serialize_to_string {
    my ($self, $fieldsref) = @_;
    my $buf = '';

    my $e = Protobuf::Encoder->new;

    my $emit = sub {
        my ($field, $value) = @_;
        $buf .= $e->encode_field( $field->number, $field->type, $value );
    };

  FIELD:
    foreach my $field (@$fieldsref) {
        my $name = $field->name;
        if ($field->is_repeated) {
            my $size_method = "${name}_size";
            next FIELD unless $self->$size_method > 0;

            my $list_method = "${name}s";
            for my $value (@{ $self->$list_method }) {
                $emit->($field, $value);
                # TODO(bradfitz): if it's ::isa("Protobuf::Message") emit it
            }
        } else {
            my $has_method = "has_${name}";

            unless ( $self->$has_method ) {
                if ($field->is_required ) {
                    die "Missing required field '$name'\n";
                } else {
                    next FIELD;
                }
            }

            $emit->( $field, $self->$name );
        }
    }
    return $buf;
}

1;
