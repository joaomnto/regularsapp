import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "invitedMembers" field.
  List<DocumentReference>? _invitedMembers;
  List<DocumentReference> get invitedMembers => _invitedMembers ?? const [];
  bool hasInvitedMembers() => _invitedMembers != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "membersUserIds" field.
  List<DocumentReference>? _membersUserIds;
  List<DocumentReference> get membersUserIds => _membersUserIds ?? const [];
  bool hasMembersUserIds() => _membersUserIds != null;

  // "createdIn" field.
  DateTime? _createdIn;
  DateTime? get createdIn => _createdIn;
  bool hasCreatedIn() => _createdIn != null;

  // "colour" field.
  Color? _colour;
  Color? get colour => _colour;
  bool hasColour() => _colour != null;

  // "adminUserIds" field.
  List<DocumentReference>? _adminUserIds;
  List<DocumentReference> get adminUserIds => _adminUserIds ?? const [];
  bool hasAdminUserIds() => _adminUserIds != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _invitedMembers = getDataList(snapshotData['invitedMembers']);
    _members = getDataList(snapshotData['members']);
    _membersUserIds = getDataList(snapshotData['membersUserIds']);
    _createdIn = snapshotData['createdIn'] as DateTime?;
    _colour = getSchemaColor(snapshotData['colour']);
    _adminUserIds = getDataList(snapshotData['adminUserIds']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  DocumentReference? createdBy,
  DateTime? createdIn,
  Color? colour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'createdBy': createdBy,
      'createdIn': createdIn,
      'colour': colour,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.invitedMembers, e2?.invitedMembers) &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.membersUserIds, e2?.membersUserIds) &&
        e1?.createdIn == e2?.createdIn &&
        e1?.colour == e2?.colour &&
        listEquality.equals(e1?.adminUserIds, e2?.adminUserIds);
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.createdBy,
        e?.invitedMembers,
        e?.members,
        e?.membersUserIds,
        e?.createdIn,
        e?.colour,
        e?.adminUserIds
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
