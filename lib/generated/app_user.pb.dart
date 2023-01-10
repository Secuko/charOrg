///
//  Generated code. Do not modify.
//  source: app_user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vol_request.pb.dart' as $0;

import 'app_user.pbenum.dart';

export 'app_user.pbenum.dart';

class AppUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppUser', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app_user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'surName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..e<AppUser_Role>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: AppUser_Role.USER, valueOf: AppUser_Role.valueOf, enumValues: AppUser_Role.values)
    ..aOM<$0.VolRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'volRequest', subBuilder: $0.VolRequest.create)
    ..hasRequiredFields = false
  ;

  AppUser._() : super();
  factory AppUser({
    $core.String? id,
    $core.String? email,
    $core.String? name,
    $core.String? surName,
    $core.String? password,
    AppUser_Role? role,
    $0.VolRequest? volRequest,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (email != null) {
      _result.email = email;
    }
    if (name != null) {
      _result.name = name;
    }
    if (surName != null) {
      _result.surName = surName;
    }
    if (password != null) {
      _result.password = password;
    }
    if (role != null) {
      _result.role = role;
    }
    if (volRequest != null) {
      _result.volRequest = volRequest;
    }
    return _result;
  }
  factory AppUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppUser clone() => AppUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppUser copyWith(void Function(AppUser) updates) => super.copyWith((message) => updates(message as AppUser)) as AppUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppUser create() => AppUser._();
  AppUser createEmptyInstance() => create();
  static $pb.PbList<AppUser> createRepeated() => $pb.PbList<AppUser>();
  @$core.pragma('dart2js:noInline')
  static AppUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppUser>(create);
  static AppUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get surName => $_getSZ(3);
  @$pb.TagNumber(4)
  set surName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSurName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSurName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  @$pb.TagNumber(6)
  AppUser_Role get role => $_getN(5);
  @$pb.TagNumber(6)
  set role(AppUser_Role v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $0.VolRequest get volRequest => $_getN(6);
  @$pb.TagNumber(7)
  set volRequest($0.VolRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasVolRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearVolRequest() => clearField(7);
  @$pb.TagNumber(7)
  $0.VolRequest ensureVolRequest() => $_ensure(6);
}

