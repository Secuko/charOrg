///
//  Generated code. Do not modify.
//  source: app_user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use appUserDescriptor instead')
const AppUser$json = const {
  '1': 'AppUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'sur_name', '3': 4, '4': 1, '5': 9, '10': 'surName'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'role', '3': 6, '4': 1, '5': 14, '6': '.app_user.AppUser.Role', '10': 'role'},
    const {'1': 'vol_request', '3': 7, '4': 1, '5': 11, '6': '.vol_request.VolRequest', '10': 'volRequest'},
  ],
  '4': const [AppUser_Role$json],
};

@$core.Deprecated('Use appUserDescriptor instead')
const AppUser_Role$json = const {
  '1': 'Role',
  '2': const [
    const {'1': 'USER', '2': 0},
    const {'1': 'VOLUNTEER', '2': 1},
    const {'1': 'ADMIN', '2': 2},
  ],
};

/// Descriptor for `AppUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appUserDescriptor = $convert.base64Decode('CgdBcHBVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSEgoEbmFtZRgDIAEoCVIEbmFtZRIZCghzdXJfbmFtZRgEIAEoCVIHc3VyTmFtZRIaCghwYXNzd29yZBgFIAEoCVIIcGFzc3dvcmQSKgoEcm9sZRgGIAEoDjIWLmFwcF91c2VyLkFwcFVzZXIuUm9sZVIEcm9sZRI4Cgt2b2xfcmVxdWVzdBgHIAEoCzIXLnZvbF9yZXF1ZXN0LlZvbFJlcXVlc3RSCnZvbFJlcXVlc3QiKgoEUm9sZRIICgRVU0VSEAASDQoJVk9MVU5URUVSEAESCQoFQURNSU4QAg==');
