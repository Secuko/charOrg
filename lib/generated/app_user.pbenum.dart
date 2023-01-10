///
//  Generated code. Do not modify.
//  source: app_user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AppUser_Role extends $pb.ProtobufEnum {
  static const AppUser_Role USER = AppUser_Role._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER');
  static const AppUser_Role VOLUNTEER = AppUser_Role._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOLUNTEER');
  static const AppUser_Role ADMIN = AppUser_Role._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADMIN');

  static const $core.List<AppUser_Role> values = <AppUser_Role> [
    USER,
    VOLUNTEER,
    ADMIN,
  ];

  static final $core.Map<$core.int, AppUser_Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AppUser_Role? valueOf($core.int value) => _byValue[value];

  const AppUser_Role._($core.int v, $core.String n) : super(v, n);
}

