import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JoinRequestsRecord extends FirestoreRecord {
  JoinRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupReference" field.
  DocumentReference? _groupReference;
  DocumentReference? get groupReference => _groupReference;
  bool hasGroupReference() => _groupReference != null;

  // "requesterReference" field.
  DocumentReference? _requesterReference;
  DocumentReference? get requesterReference => _requesterReference;
  bool hasRequesterReference() => _requesterReference != null;

  // "requesterName" field.
  String? _requesterName;
  String get requesterName => _requesterName ?? '';
  bool hasRequesterName() => _requesterName != null;

  // "requesterPhoto" field.
  String? _requesterPhoto;
  String get requesterPhoto => _requesterPhoto ?? '';
  bool hasRequesterPhoto() => _requesterPhoto != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "status" field.
  JoinRequestStatus? _status;
  JoinRequestStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "resolvedAt" field.
  DateTime? _resolvedAt;
  DateTime? get resolvedAt => _resolvedAt;
  bool hasResolvedAt() => _resolvedAt != null;

  // "resolvedBy" field.
  DocumentReference? _resolvedBy;
  DocumentReference? get resolvedBy => _resolvedBy;
  bool hasResolvedBy() => _resolvedBy != null;

  // "ttlDeleteAt" field.
  DateTime? _ttlDeleteAt;
  DateTime? get ttlDeleteAt => _ttlDeleteAt;
  bool hasTtlDeleteAt() => _ttlDeleteAt != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "joinCodeUsed" field.
  String? _joinCodeUsed;
  String get joinCodeUsed => _joinCodeUsed ?? '';
  bool hasJoinCodeUsed() => _joinCodeUsed != null;

  void _initializeFields() {
    _groupReference = snapshotData['groupReference'] as DocumentReference?;
    _requesterReference =
        snapshotData['requesterReference'] as DocumentReference?;
    _requesterName = snapshotData['requesterName'] as String?;
    _requesterPhoto = snapshotData['requesterPhoto'] as String?;
    _message = snapshotData['message'] as String?;
    _status = snapshotData['status'] is JoinRequestStatus
        ? snapshotData['status']
        : deserializeEnum<JoinRequestStatus>(snapshotData['status']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _resolvedAt = snapshotData['resolvedAt'] as DateTime?;
    _resolvedBy = snapshotData['resolvedBy'] as DocumentReference?;
    _ttlDeleteAt = snapshotData['ttlDeleteAt'] as DateTime?;
    _groupName = snapshotData['groupName'] as String?;
    _joinCodeUsed = snapshotData['joinCodeUsed'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('JoinRequests');

  static Stream<JoinRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JoinRequestsRecord.fromSnapshot(s));

  static Future<JoinRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JoinRequestsRecord.fromSnapshot(s));

  static JoinRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JoinRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JoinRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JoinRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JoinRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JoinRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJoinRequestsRecordData({
  DocumentReference? groupReference,
  DocumentReference? requesterReference,
  String? requesterName,
  String? requesterPhoto,
  String? message,
  JoinRequestStatus? status,
  DateTime? createdAt,
  DateTime? resolvedAt,
  DocumentReference? resolvedBy,
  DateTime? ttlDeleteAt,
  String? groupName,
  String? joinCodeUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupReference': groupReference,
      'requesterReference': requesterReference,
      'requesterName': requesterName,
      'requesterPhoto': requesterPhoto,
      'message': message,
      'status': status,
      'createdAt': createdAt,
      'resolvedAt': resolvedAt,
      'resolvedBy': resolvedBy,
      'ttlDeleteAt': ttlDeleteAt,
      'groupName': groupName,
      'joinCodeUsed': joinCodeUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class JoinRequestsRecordDocumentEquality
    implements Equality<JoinRequestsRecord> {
  const JoinRequestsRecordDocumentEquality();

  @override
  bool equals(JoinRequestsRecord? e1, JoinRequestsRecord? e2) {
    return e1?.groupReference == e2?.groupReference &&
        e1?.requesterReference == e2?.requesterReference &&
        e1?.requesterName == e2?.requesterName &&
        e1?.requesterPhoto == e2?.requesterPhoto &&
        e1?.message == e2?.message &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.resolvedAt == e2?.resolvedAt &&
        e1?.resolvedBy == e2?.resolvedBy &&
        e1?.ttlDeleteAt == e2?.ttlDeleteAt &&
        e1?.groupName == e2?.groupName &&
        e1?.joinCodeUsed == e2?.joinCodeUsed;
  }

  @override
  int hash(JoinRequestsRecord? e) => const ListEquality().hash([
        e?.groupReference,
        e?.requesterReference,
        e?.requesterName,
        e?.requesterPhoto,
        e?.message,
        e?.status,
        e?.createdAt,
        e?.resolvedAt,
        e?.resolvedBy,
        e?.ttlDeleteAt,
        e?.groupName,
        e?.joinCodeUsed
      ]);

  @override
  bool isValidKey(Object? o) => o is JoinRequestsRecord;
}
