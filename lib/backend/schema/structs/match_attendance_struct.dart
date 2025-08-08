// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchAttendanceStruct extends FFFirebaseStruct {
  MatchAttendanceStruct({
    /// Status of attendance of a player
    AttendanceStatus? status,
    EmbeddedPlayerStruct? player,
    DocumentReference? userRefId,
    DocumentReference? memberRefId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _player = player,
        _userRefId = userRefId,
        _memberRefId = memberRefId,
        super(firestoreUtilData);

  // "status" field.
  AttendanceStatus? _status;
  AttendanceStatus? get status => _status;
  set status(AttendanceStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "player" field.
  EmbeddedPlayerStruct? _player;
  EmbeddedPlayerStruct get player => _player ?? EmbeddedPlayerStruct();
  set player(EmbeddedPlayerStruct? val) => _player = val;

  void updatePlayer(Function(EmbeddedPlayerStruct) updateFn) {
    updateFn(_player ??= EmbeddedPlayerStruct());
  }

  bool hasPlayer() => _player != null;

  // "userRefId" field.
  DocumentReference? _userRefId;
  DocumentReference? get userRefId => _userRefId;
  set userRefId(DocumentReference? val) => _userRefId = val;

  bool hasUserRefId() => _userRefId != null;

  // "memberRefId" field.
  DocumentReference? _memberRefId;
  DocumentReference? get memberRefId => _memberRefId;
  set memberRefId(DocumentReference? val) => _memberRefId = val;

  bool hasMemberRefId() => _memberRefId != null;

  static MatchAttendanceStruct fromMap(Map<String, dynamic> data) =>
      MatchAttendanceStruct(
        status: data['status'] is AttendanceStatus
            ? data['status']
            : deserializeEnum<AttendanceStatus>(data['status']),
        player: data['player'] is EmbeddedPlayerStruct
            ? data['player']
            : EmbeddedPlayerStruct.maybeFromMap(data['player']),
        userRefId: data['userRefId'] as DocumentReference?,
        memberRefId: data['memberRefId'] as DocumentReference?,
      );

  static MatchAttendanceStruct? maybeFromMap(dynamic data) => data is Map
      ? MatchAttendanceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status?.serialize(),
        'player': _player?.toMap(),
        'userRefId': _userRefId,
        'memberRefId': _memberRefId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'player': serializeParam(
          _player,
          ParamType.DataStruct,
        ),
        'userRefId': serializeParam(
          _userRefId,
          ParamType.DocumentReference,
        ),
        'memberRefId': serializeParam(
          _memberRefId,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MatchAttendanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      MatchAttendanceStruct(
        status: deserializeParam<AttendanceStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        player: deserializeStructParam(
          data['player'],
          ParamType.DataStruct,
          false,
          structBuilder: EmbeddedPlayerStruct.fromSerializableMap,
        ),
        userRefId: deserializeParam(
          data['userRefId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        memberRefId: deserializeParam(
          data['memberRefId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Groups', 'Members'],
        ),
      );

  @override
  String toString() => 'MatchAttendanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchAttendanceStruct &&
        status == other.status &&
        player == other.player &&
        userRefId == other.userRefId &&
        memberRefId == other.memberRefId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, player, userRefId, memberRefId]);
}

MatchAttendanceStruct createMatchAttendanceStruct({
  AttendanceStatus? status,
  EmbeddedPlayerStruct? player,
  DocumentReference? userRefId,
  DocumentReference? memberRefId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchAttendanceStruct(
      status: status,
      player: player ?? (clearUnsetFields ? EmbeddedPlayerStruct() : null),
      userRefId: userRefId,
      memberRefId: memberRefId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchAttendanceStruct? updateMatchAttendanceStruct(
  MatchAttendanceStruct? matchAttendance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    matchAttendance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMatchAttendanceStructData(
  Map<String, dynamic> firestoreData,
  MatchAttendanceStruct? matchAttendance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchAttendance == null) {
    return;
  }
  if (matchAttendance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && matchAttendance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchAttendanceData =
      getMatchAttendanceFirestoreData(matchAttendance, forFieldValue);
  final nestedData =
      matchAttendanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = matchAttendance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchAttendanceFirestoreData(
  MatchAttendanceStruct? matchAttendance, [
  bool forFieldValue = false,
]) {
  if (matchAttendance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(matchAttendance.toMap());

  // Handle nested data for "player" field.
  addEmbeddedPlayerStructData(
    firestoreData,
    matchAttendance.hasPlayer() ? matchAttendance.player : null,
    'player',
    forFieldValue,
  );

  // Add any Firestore field values
  matchAttendance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchAttendanceListFirestoreData(
  List<MatchAttendanceStruct>? matchAttendances,
) =>
    matchAttendances
        ?.map((e) => getMatchAttendanceFirestoreData(e, true))
        .toList() ??
    [];
