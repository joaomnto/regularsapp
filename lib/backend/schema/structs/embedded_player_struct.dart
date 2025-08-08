// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Descriptive player for a Team
class EmbeddedPlayerStruct extends FFFirebaseStruct {
  EmbeddedPlayerStruct({
    String? name,
    String? photoUrl,

    /// Group member Id for this player
    DocumentReference? memberRefId,

    /// userIdForThePlayer
    DocumentReference? userRefId,
    bool? isPlayer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _photoUrl = photoUrl,
        _memberRefId = memberRefId,
        _userRefId = userRefId,
        _isPlayer = isPlayer,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "memberRefId" field.
  DocumentReference? _memberRefId;
  DocumentReference? get memberRefId => _memberRefId;
  set memberRefId(DocumentReference? val) => _memberRefId = val;

  bool hasMemberRefId() => _memberRefId != null;

  // "userRefId" field.
  DocumentReference? _userRefId;
  DocumentReference? get userRefId => _userRefId;
  set userRefId(DocumentReference? val) => _userRefId = val;

  bool hasUserRefId() => _userRefId != null;

  // "isPlayer" field.
  bool? _isPlayer;
  bool get isPlayer => _isPlayer ?? false;
  set isPlayer(bool? val) => _isPlayer = val;

  bool hasIsPlayer() => _isPlayer != null;

  static EmbeddedPlayerStruct fromMap(Map<String, dynamic> data) =>
      EmbeddedPlayerStruct(
        name: data['name'] as String?,
        photoUrl: data['photoUrl'] as String?,
        memberRefId: data['memberRefId'] as DocumentReference?,
        userRefId: data['userRefId'] as DocumentReference?,
        isPlayer: data['isPlayer'] as bool?,
      );

  static EmbeddedPlayerStruct? maybeFromMap(dynamic data) => data is Map
      ? EmbeddedPlayerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'photoUrl': _photoUrl,
        'memberRefId': _memberRefId,
        'userRefId': _userRefId,
        'isPlayer': _isPlayer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'photoUrl': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'memberRefId': serializeParam(
          _memberRefId,
          ParamType.DocumentReference,
        ),
        'userRefId': serializeParam(
          _userRefId,
          ParamType.DocumentReference,
        ),
        'isPlayer': serializeParam(
          _isPlayer,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EmbeddedPlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmbeddedPlayerStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photoUrl'],
          ParamType.String,
          false,
        ),
        memberRefId: deserializeParam(
          data['memberRefId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Groups', 'Members'],
        ),
        userRefId: deserializeParam(
          data['userRefId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        isPlayer: deserializeParam(
          data['isPlayer'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EmbeddedPlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmbeddedPlayerStruct &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        memberRefId == other.memberRefId &&
        userRefId == other.userRefId &&
        isPlayer == other.isPlayer;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, photoUrl, memberRefId, userRefId, isPlayer]);
}

EmbeddedPlayerStruct createEmbeddedPlayerStruct({
  String? name,
  String? photoUrl,
  DocumentReference? memberRefId,
  DocumentReference? userRefId,
  bool? isPlayer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmbeddedPlayerStruct(
      name: name,
      photoUrl: photoUrl,
      memberRefId: memberRefId,
      userRefId: userRefId,
      isPlayer: isPlayer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmbeddedPlayerStruct? updateEmbeddedPlayerStruct(
  EmbeddedPlayerStruct? embeddedPlayer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    embeddedPlayer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmbeddedPlayerStructData(
  Map<String, dynamic> firestoreData,
  EmbeddedPlayerStruct? embeddedPlayer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (embeddedPlayer == null) {
    return;
  }
  if (embeddedPlayer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && embeddedPlayer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final embeddedPlayerData =
      getEmbeddedPlayerFirestoreData(embeddedPlayer, forFieldValue);
  final nestedData =
      embeddedPlayerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = embeddedPlayer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmbeddedPlayerFirestoreData(
  EmbeddedPlayerStruct? embeddedPlayer, [
  bool forFieldValue = false,
]) {
  if (embeddedPlayer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(embeddedPlayer.toMap());

  // Add any Firestore field values
  embeddedPlayer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmbeddedPlayerListFirestoreData(
  List<EmbeddedPlayerStruct>? embeddedPlayers,
) =>
    embeddedPlayers
        ?.map((e) => getEmbeddedPlayerFirestoreData(e, true))
        .toList() ??
    [];
