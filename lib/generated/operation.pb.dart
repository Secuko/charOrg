///
//  Generated code. Do not modify.
//  source: operation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $1;

import 'vol_request.pbenum.dart' as $0;

class Operation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Operation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'operation'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersId')
    ..aOM<$1.Chat>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chat', subBuilder: $1.Chat.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'searchReqId')
    ..e<$0.Status>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.PENDING, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..hasRequiredFields = false
  ;

  Operation._() : super();
  factory Operation({
    $core.String? id,
    $core.Iterable<$core.String>? usersId,
    $1.Chat? chat,
    $core.String? searchReqId,
    $0.Status? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (usersId != null) {
      _result.usersId.addAll(usersId);
    }
    if (chat != null) {
      _result.chat = chat;
    }
    if (searchReqId != null) {
      _result.searchReqId = searchReqId;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Operation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Operation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Operation clone() => Operation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Operation copyWith(void Function(Operation) updates) => super.copyWith((message) => updates(message as Operation)) as Operation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Operation create() => Operation._();
  Operation createEmptyInstance() => create();
  static $pb.PbList<Operation> createRepeated() => $pb.PbList<Operation>();
  @$core.pragma('dart2js:noInline')
  static Operation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Operation>(create);
  static Operation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get usersId => $_getList(1);

  @$pb.TagNumber(3)
  $1.Chat get chat => $_getN(2);
  @$pb.TagNumber(3)
  set chat($1.Chat v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChat() => $_has(2);
  @$pb.TagNumber(3)
  void clearChat() => clearField(3);
  @$pb.TagNumber(3)
  $1.Chat ensureChat() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get searchReqId => $_getSZ(3);
  @$pb.TagNumber(4)
  set searchReqId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSearchReqId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSearchReqId() => clearField(4);

  @$pb.TagNumber(5)
  $0.Status get status => $_getN(4);
  @$pb.TagNumber(5)
  set status($0.Status v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

