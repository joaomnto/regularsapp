import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupJoinCodesRecord extends FirestoreRecord {
  GroupJoinCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupReference" field.
  DocumentReference? _groupReference;
  DocumentReference? get groupReference => _groupReference;
  bool hasGroupReference() => _groupReference != null;

  // "joinCodeHash" field.
  String? _joinCodeHash;
  String get joinCodeHash => _joinCodeHash ?? '';
  bool hasJoinCodeHash() => _joinCodeHash != null;

  // "expiresAt" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "status" field.
  JoinCodeStatus? _status;
  JoinCodeStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _groupReference = snapshotData['groupReference'] as DocumentReference?;
    _joinCodeHash = snapshotData['joinCodeHash'] as String?;
    _expiresAt = snapshotData['expiresAt'] as DateTime?;
    _groupName = snapshotData['groupName'] as String?;
    _status = snapshotData['status'] is JoinCodeStatus
        ? snapshotData['status']
        : deserializeEnum<JoinCodeStatus>(snapshotData['status']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _updatedDate = snapshotData['updatedDate'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('GroupJoinCodes');

  static Stream<GroupJoinCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupJoinCodesRecord.fromSnapshot(s));

  static Future<GroupJoinCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupJoinCodesRecord.fromSnapshot(s));

  static GroupJoinCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupJoinCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupJoinCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupJoinCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupJoinCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupJoinCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupJoinCodesRecordData({
  DocumentReference? groupReference,
  String? joinCodeHash,
  DateTime? expiresAt,
  String? groupName,
  JoinCodeStatus? status,
  DateTime? createdDate,
  DateTime? updatedDate,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupReference': groupReference,
      'joinCodeHash': joinCodeHash,
      'expiresAt': expiresAt,
      'groupName': groupName,
      'status': status,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupJoinCodesRecordDocumentEquality
    implements Equality<GroupJoinCodesRecord> {
  const GroupJoinCodesRecordDocumentEquality();

  @override
  bool equals(GroupJoinCodesRecord? e1, GroupJoinCodesRecord? e2) {
    return e1?.groupReference == e2?.groupReference &&
        e1?.joinCodeHash == e2?.joinCodeHash &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.groupName == e2?.groupName &&
        e1?.status == e2?.status &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(GroupJoinCodesRecord? e) => const ListEquality().hash([
        e?.groupReference,
        e?.joinCodeHash,
        e?.expiresAt,
        e?.groupName,
        e?.status,
        e?.createdDate,
        e?.updatedDate,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupJoinCodesRecord;
}
