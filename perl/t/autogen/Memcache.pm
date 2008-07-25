## Boilerplate:
# Auto-generated code from the protocol buffer compiler.  DO NOT EDIT!

use strict;
use warnings;
use 5.6.1;
use Protobuf;

package ProtoBuf::memcache;

## Top-level enums:

## Top-level extensions:

## All nested enums:
our $_MEMCACHESERVICEERROR_ERRORCODE = Protobuf::EnumDescriptor->new(
  name => 'ErrorCode',
  full_name => 'appengine_api.MemcacheServiceError.ErrorCode',
  filename => 'ErrorCode',
  values => [
    Protobuf::EnumValueDescriptor->new(name => 'OK', index => 0, number => 0, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'UNSPECIFIED_ERROR', index => 1, number => 1, type => undef),
]);

our $_MEMCACHESETREQUEST_SETPOLICY = Protobuf::EnumDescriptor->new(
  name => 'SetPolicy',
  full_name => 'appengine_api.MemcacheSetRequest.SetPolicy',
  filename => 'SetPolicy',
  values => [
    Protobuf::EnumValueDescriptor->new(name => 'SET', index => 0, number => 1, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'ADD', index => 1, number => 2, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'REPLACE', index => 2, number => 3, type => undef),
]);

our $_MEMCACHESETRESPONSE_SETSTATUSCODE = Protobuf::EnumDescriptor->new(
  name => 'SetStatusCode',
  full_name => 'appengine_api.MemcacheSetResponse.SetStatusCode',
  filename => 'SetStatusCode',
  values => [
    Protobuf::EnumValueDescriptor->new(name => 'STORED', index => 0, number => 1, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'NOT_STORED', index => 1, number => 2, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'ERROR', index => 2, number => 3, type => undef),
]);

our $_MEMCACHEDELETERESPONSE_DELETESTATUSCODE = Protobuf::EnumDescriptor->new(
  name => 'DeleteStatusCode',
  full_name => 'appengine_api.MemcacheDeleteResponse.DeleteStatusCode',
  filename => 'DeleteStatusCode',
  values => [
    Protobuf::EnumValueDescriptor->new(name => 'DELETED', index => 0, number => 1, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'NOT_FOUND', index => 1, number => 2, type => undef),
]);

our $_MEMCACHEINCREMENTREQUEST_DIRECTION = Protobuf::EnumDescriptor->new(
  name => 'Direction',
  full_name => 'appengine_api.MemcacheIncrementRequest.Direction',
  filename => 'Direction',
  values => [
    Protobuf::EnumValueDescriptor->new(name => 'INCREMENT', index => 0, number => 1, type => undef),
    Protobuf::EnumValueDescriptor->new(name => 'DECREMENT', index => 1, number => 2, type => undef),
]);

## Message descriptors:

our $_MEMCACHESERVICEERROR = Protobuf::Descriptor->new(
  name => 'MemcacheServiceError',
  full_name => 'appengine_api.MemcacheServiceError',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
    $_MEMCACHESERVICEERROR_ERRORCODE,
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEGETREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheGetRequest',
  full_name => 'appengine_api.MemcacheGetRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'key', index => 0, number => 1,
      type => 12, cpp_type => 9, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'key2', index => 1, number => 20,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'key3', index => 2, number => 30,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEGETRESPONSE_ITEM = Protobuf::Descriptor->new(
  name => 'Item',
  full_name => 'appengine_api.MemcacheGetResponse.Item',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'key', index => 0, number => 2,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'value', index => 1, number => 3,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'flags', index => 2, number => 4,
      type => 7, cpp_type => 3, label => 1,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)

our $_MEMCACHEGETRESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheGetResponse',
  full_name => 'appengine_api.MemcacheGetResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'item', index => 0, number => 1,
      type => 10, cpp_type => 10, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHESETREQUEST_ITEM = Protobuf::Descriptor->new(
  name => 'Item',
  full_name => 'appengine_api.MemcacheSetRequest.Item',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'key', index => 0, number => 2,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'value', index => 1, number => 3,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'flags', index => 2, number => 4,
      type => 7, cpp_type => 3, label => 1,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'set_policy', index => 3, number => 5,
      type => 14, cpp_type => 8, label => 1,
      default_value => 1,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'expiration_time', index => 4, number => 6,
      type => 7, cpp_type => 3, label => 1,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)

our $_MEMCACHESETREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheSetRequest',
  full_name => 'appengine_api.MemcacheSetRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'item', index => 0, number => 1,
      type => 10, cpp_type => 10, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
    $_MEMCACHESETREQUEST_SETPOLICY,
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHESETRESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheSetResponse',
  full_name => 'appengine_api.MemcacheSetResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'set_status', index => 0, number => 1,
      type => 14, cpp_type => 8, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
    $_MEMCACHESETRESPONSE_SETSTATUSCODE,
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEDELETEREQUEST_ITEM = Protobuf::Descriptor->new(
  name => 'Item',
  full_name => 'appengine_api.MemcacheDeleteRequest.Item',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'key', index => 0, number => 2,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'delete_time', index => 1, number => 3,
      type => 7, cpp_type => 3, label => 1,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)

our $_MEMCACHEDELETEREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheDeleteRequest',
  full_name => 'appengine_api.MemcacheDeleteRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'item', index => 0, number => 1,
      type => 10, cpp_type => 10, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEDELETERESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheDeleteResponse',
  full_name => 'appengine_api.MemcacheDeleteResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'delete_status', index => 0, number => 1,
      type => 14, cpp_type => 8, label => 3,
      default_value => [],
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
    $_MEMCACHEDELETERESPONSE_DELETESTATUSCODE,
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEINCREMENTREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheIncrementRequest',
  full_name => 'appengine_api.MemcacheIncrementRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'key', index => 0, number => 1,
      type => 12, cpp_type => 9, label => 2,
      default_value => "",
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'delta', index => 1, number => 2,
      type => 4, cpp_type => 4, label => 1,
      default_value => 1,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'direction', index => 2, number => 3,
      type => 14, cpp_type => 8, label => 1,
      default_value => 1,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
    $_MEMCACHEINCREMENTREQUEST_DIRECTION,
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEINCREMENTRESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheIncrementResponse',
  full_name => 'appengine_api.MemcacheIncrementResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'new_value', index => 0, number => 1,
      type => 4, cpp_type => 4, label => 1,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEFLUSHREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheFlushRequest',
  full_name => 'appengine_api.MemcacheFlushRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHEFLUSHRESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheFlushResponse',
  full_name => 'appengine_api.MemcacheFlushResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHESTATSREQUEST = Protobuf::Descriptor->new(
  name => 'MemcacheStatsRequest',
  full_name => 'appengine_api.MemcacheStatsRequest',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MERGEDNAMESPACESTATS = Protobuf::Descriptor->new(
  name => 'MergedNamespaceStats',
  full_name => 'appengine_api.MergedNamespaceStats',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'hits', index => 0, number => 1,
      type => 4, cpp_type => 4, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'misses', index => 1, number => 2,
      type => 4, cpp_type => 4, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'byte_hits', index => 2, number => 3,
      type => 4, cpp_type => 4, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'items', index => 3, number => 4,
      type => 4, cpp_type => 4, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'bytes', index => 4, number => 5,
      type => 4, cpp_type => 4, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
    Protobuf::FieldDescriptor->new(
      name => 'oldest_item_age', index => 5, number => 6,
      type => 7, cpp_type => 3, label => 2,
      default_value => 0,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)


our $_MEMCACHESTATSRESPONSE = Protobuf::Descriptor->new(
  name => 'MemcacheStatsResponse',
  full_name => 'appengine_api.MemcacheStatsResponse',
  filename => 'memcache.proto',
  containing_type => undef,
  fields => [
    Protobuf::FieldDescriptor->new(
      name => 'stats', index => 0, number => 1,
      type => 11, cpp_type => 10, label => 1,
      default_value => undef,
      message_type => undef, enum_type => undef, containing_type => undef,
      is_extension => False, extension_scope => undef),
  ],
  extensions => [
  ],
  nested_types => [],  # TODO(bradfitz): Implement.
  enum_types => [
  ],
  options => MessageOptions->new(
  ),
)

## Imports:

## Fix foreign fields:
$_MEMCACHEGETRESPONSE->fields_by_name('item')->set_message_type($_MEMCACHEGETRESPONSE_ITEM);
$_MEMCACHESETREQUEST_ITEM->fields_by_name('set_policy')->set_enum_type($_MEMCACHESETREQUEST_SETPOLICY);
$_MEMCACHESETREQUEST->fields_by_name('item')->set_message_type($_MEMCACHESETREQUEST_ITEM);
$_MEMCACHESETRESPONSE->fields_by_name('set_status')->set_enum_type($_MEMCACHESETRESPONSE_SETSTATUSCODE);
$_MEMCACHEDELETEREQUEST->fields_by_name('item')->set_message_type($_MEMCACHEDELETEREQUEST_ITEM);
$_MEMCACHEDELETERESPONSE->fields_by_name('delete_status')->set_enum_type($_MEMCACHEDELETERESPONSE_DELETESTATUSCODE);
$_MEMCACHEINCREMENTREQUEST->fields_by_name('direction')->set_enum_type($_MEMCACHEINCREMENTREQUEST_DIRECTION);
$_MEMCACHESTATSRESPONSE->fields_by_name('stats')->set_message_type($_MERGEDNAMESPACESTATS);

## Messages:
Protobuf::Message->GenerateClass('MemcacheServiceError', $_MEMCACHESERVICEERROR);

Protobuf::Message->GenerateClass('MemcacheGetRequest', $_MEMCACHEGETREQUEST);

Protobuf::Message->GenerateClass('MemcacheGetResponse', $_MEMCACHEGETRESPONSE);
Protobuf::Message->GenerateClass('MemcacheGetResponse::Item', $_MEMCACHEGETRESPONSE_ITEM);

Protobuf::Message->GenerateClass('MemcacheSetRequest', $_MEMCACHESETREQUEST);
Protobuf::Message->GenerateClass('MemcacheSetRequest::Item', $_MEMCACHESETREQUEST_ITEM);

Protobuf::Message->GenerateClass('MemcacheSetResponse', $_MEMCACHESETRESPONSE);

Protobuf::Message->GenerateClass('MemcacheDeleteRequest', $_MEMCACHEDELETEREQUEST);
Protobuf::Message->GenerateClass('MemcacheDeleteRequest::Item', $_MEMCACHEDELETEREQUEST_ITEM);

Protobuf::Message->GenerateClass('MemcacheDeleteResponse', $_MEMCACHEDELETERESPONSE);

Protobuf::Message->GenerateClass('MemcacheIncrementRequest', $_MEMCACHEINCREMENTREQUEST);

Protobuf::Message->GenerateClass('MemcacheIncrementResponse', $_MEMCACHEINCREMENTRESPONSE);

Protobuf::Message->GenerateClass('MemcacheFlushRequest', $_MEMCACHEFLUSHREQUEST);

Protobuf::Message->GenerateClass('MemcacheFlushResponse', $_MEMCACHEFLUSHRESPONSE);

Protobuf::Message->GenerateClass('MemcacheStatsRequest', $_MEMCACHESTATSREQUEST);

Protobuf::Message->GenerateClass('MergedNamespaceStats', $_MERGEDNAMESPACESTATS);

Protobuf::Message->GenerateClass('MemcacheStatsResponse', $_MEMCACHESTATSRESPONSE);

## Fix foreign fields in extensions:
## Services:
