///
//  Generated code. Do not modify.
//  source: vol_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vol_request.pbenum.dart';

export 'vol_request.pbenum.dart';

class VolRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VolRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vol_request'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..e<Sex>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: Sex.MALE, valueOf: Sex.valueOf, enumValues: Sex.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'livArea')
    ..e<Status>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.PENDING, valueOf: Status.valueOf, enumValues: Status.values)
    ..hasRequiredFields = false
  ;

  VolRequest._() : super();
  factory VolRequest({
    $core.String? id,
    $core.String? phone,
    $core.int? age,
    Sex? sex,
    $core.String? livArea,
    Status? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (livArea != null) {
      _result.livArea = livArea;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory VolRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VolRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VolRequest clone() => VolRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VolRequest copyWith(void Function(VolRequest) updates) => super.copyWith((message) => updates(message as VolRequest)) as VolRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VolRequest create() => VolRequest._();
  VolRequest createEmptyInstance() => create();
  static $pb.PbList<VolRequest> createRepeated() => $pb.PbList<VolRequest>();
  @$core.pragma('dart2js:noInline')
  static VolRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VolRequest>(create);
  static VolRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);

  @$pb.TagNumber(4)
  Sex get sex => $_getN(3);
  @$pb.TagNumber(4)
  set sex(Sex v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get livArea => $_getSZ(4);
  @$pb.TagNumber(5)
  set livArea($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLivArea() => $_has(4);
  @$pb.TagNumber(5)
  void clearLivArea() => clearField(5);

  @$pb.TagNumber(6)
  Status get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(Status v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);
}

