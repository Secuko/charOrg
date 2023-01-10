///
//  Generated code. Do not modify.
//  source: vol_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sexDescriptor instead')
const Sex$json = const {
  '1': 'Sex',
  '2': const [
    const {'1': 'MALE', '2': 0},
    const {'1': 'FEMALE', '2': 1},
  ],
};

/// Descriptor for `Sex`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sexDescriptor = $convert.base64Decode('CgNTZXgSCAoETUFMRRAAEgoKBkZFTUFMRRAB');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'ACCEPTED', '2': 1},
    const {'1': 'REJECTED', '2': 2},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSCwoHUEVORElORxAAEgwKCEFDQ0VQVEVEEAESDAoIUkVKRUNURUQQAg==');
@$core.Deprecated('Use volRequestDescriptor instead')
const VolRequest$json = const {
  '1': 'VolRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'age', '3': 3, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'sex', '3': 4, '4': 1, '5': 14, '6': '.vol_request.Sex', '10': 'sex'},
    const {'1': 'liv_area', '3': 5, '4': 1, '5': 9, '10': 'livArea'},
    const {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.vol_request.Status', '10': 'status'},
  ],
};

/// Descriptor for `VolRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List volRequestDescriptor = $convert.base64Decode('CgpWb2xSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIUCgVwaG9uZRgCIAEoCVIFcGhvbmUSEAoDYWdlGAMgASgFUgNhZ2USIgoDc2V4GAQgASgOMhAudm9sX3JlcXVlc3QuU2V4UgNzZXgSGQoIbGl2X2FyZWEYBSABKAlSB2xpdkFyZWESKwoGc3RhdHVzGAYgASgOMhMudm9sX3JlcXVlc3QuU3RhdHVzUgZzdGF0dXM=');
