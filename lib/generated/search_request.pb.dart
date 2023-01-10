///
//  Generated code. Do not modify.
//  source: search_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vol_request.pbenum.dart' as $0;

class SearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'search_request'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..e<$0.Sex>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sex', $pb.PbFieldType.OE, defaultOrMaker: $0.Sex.MALE, valueOf: $0.Sex.valueOf, enumValues: $0.Sex.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'missArea')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'missTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addInf')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo')
    ..e<$0.Status>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.PENDING, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  SearchRequest._() : super();
  factory SearchRequest({
    $core.String? id,
    $core.String? fullName,
    $core.int? age,
    $0.Sex? sex,
    $core.String? missArea,
    $core.String? missTime,
    $core.String? addInf,
    $core.String? photo,
    $0.Status? status,
    $core.String? userId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (missArea != null) {
      _result.missArea = missArea;
    }
    if (missTime != null) {
      _result.missTime = missTime;
    }
    if (addInf != null) {
      _result.addInf = addInf;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (status != null) {
      _result.status = status;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest)) as SearchRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);

  @$pb.TagNumber(4)
  $0.Sex get sex => $_getN(3);
  @$pb.TagNumber(4)
  set sex($0.Sex v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get missArea => $_getSZ(4);
  @$pb.TagNumber(5)
  set missArea($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMissArea() => $_has(4);
  @$pb.TagNumber(5)
  void clearMissArea() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get missTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set missTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMissTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearMissTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get addInf => $_getSZ(6);
  @$pb.TagNumber(7)
  set addInf($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAddInf() => $_has(6);
  @$pb.TagNumber(7)
  void clearAddInf() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get photo => $_getSZ(7);
  @$pb.TagNumber(8)
  set photo($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhoto() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhoto() => clearField(8);

  @$pb.TagNumber(9)
  $0.Status get status => $_getN(8);
  @$pb.TagNumber(9)
  set status($0.Status v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userId => $_getSZ(9);
  @$pb.TagNumber(10)
  set userId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserId() => clearField(10);
}

