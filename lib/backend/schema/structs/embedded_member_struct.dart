// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EmbeddedMemberStruct extends FFFirebaseStruct {
  EmbeddedMemberStruct({
    DocumentReference? memberRefId,

    /// User this member is attached to (optional for group local users)
    DocumentReference? userRefId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memberRefId = memberRefId,
        _userRefId = userRefId,
        super(firestoreUtilData);

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

  static EmbeddedMemberStruct fromMap(Map<String, dynamic> data) =>
      EmbeddedMemberStruct(
        memberRefId: data['memberRefId'] as DocumentReference?,
        userRefId: data['userRefId'] as DocumentReference?,
      );

  static EmbeddedMemberStruct? maybeFromMap(dynamic data) => data is Map
      ? EmbeddedMemberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'memberRefId': _memberRefId,
        'userRefId': _userRefId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'memberRefId': serializeParam(
          _memberRefId,
          ParamType.DocumentReference,
        ),
        'userRefId': serializeParam(
          _userRefId,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static EmbeddedMemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmbeddedMemberStruct(
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
      );

  @override
  String toString() => 'EmbeddedMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmbeddedMemberStruct &&
        memberRefId == other.memberRefId &&
        userRefId == other.userRefId;
  }

  @override
  int get hashCode => const ListEquality().hash([memberRefId, userRefId]);
}

EmbeddedMemberStruct createEmbeddedMemberStruct({
  DocumentReference? memberRefId,
  DocumentReference? userRefId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmbeddedMemberStruct(
      memberRefId: memberRefId,
      userRefId: userRefId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmbeddedMemberStruct? updateEmbeddedMemberStruct(
  EmbeddedMemberStruct? embeddedMember, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    embeddedMember
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmbeddedMemberStructData(
  Map<String, dynamic> firestoreData,
  EmbeddedMemberStruct? embeddedMember,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (embeddedMember == null) {
    return;
  }
  if (embeddedMember.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && embeddedMember.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final embeddedMemberData =
      getEmbeddedMemberFirestoreData(embeddedMember, forFieldValue);
  final nestedData =
      embeddedMemberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = embeddedMember.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmbeddedMemberFirestoreData(
  EmbeddedMemberStruct? embeddedMember, [
  bool forFieldValue = false,
]) {
  if (embeddedMember == null) {
    return {};
  }
  final firestoreData = mapToFirestore(embeddedMember.toMap());

  // Add any Firestore field values
  embeddedMember.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmbeddedMemberListFirestoreData(
  List<EmbeddedMemberStruct>? embeddedMembers,
) =>
    embeddedMembers
        ?.map((e) => getEmbeddedMemberFirestoreData(e, true))
        .toList() ??
    [];
