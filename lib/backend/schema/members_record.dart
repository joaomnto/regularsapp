import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Roles per group member
class MembersRecord extends FirestoreRecord {
  MembersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isPlayer" field.
  bool? _isPlayer;
  bool get isPlayer => _isPlayer ?? false;
  bool hasIsPlayer() => _isPlayer != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "memberStatus" field.
  MemberStatus? _memberStatus;
  MemberStatus? get memberStatus => _memberStatus;
  bool hasMemberStatus() => _memberStatus != null;

  // "invitedIn" field.
  DateTime? _invitedIn;
  DateTime? get invitedIn => _invitedIn;
  bool hasInvitedIn() => _invitedIn != null;

  // "acceptedIn" field.
  DateTime? _acceptedIn;
  DateTime? get acceptedIn => _acceptedIn;
  bool hasAcceptedIn() => _acceptedIn != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "groupRef" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "addedBy" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isPlayer = snapshotData['isPlayer'] as bool?;
    _name = snapshotData['name'] as String?;
    _photoUrl = snapshotData['photoUrl'] as String?;
    _memberStatus = snapshotData['memberStatus'] is MemberStatus
        ? snapshotData['memberStatus']
        : deserializeEnum<MemberStatus>(snapshotData['memberStatus']);
    _invitedIn = snapshotData['invitedIn'] as DateTime?;
    _acceptedIn = snapshotData['acceptedIn'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _groupRef = snapshotData['groupRef'] as DocumentReference?;
    _addedBy = snapshotData['addedBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Members')
          : FirebaseFirestore.instance.collectionGroup('Members');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Members').doc(id);

  static Stream<MembersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembersRecord.fromSnapshot(s));

  static Future<MembersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembersRecord.fromSnapshot(s));

  static MembersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembersRecordData({
  bool? isAdmin,
  bool? isPlayer,
  String? name,
  String? photoUrl,
  MemberStatus? memberStatus,
  DateTime? invitedIn,
  DateTime? acceptedIn,
  DocumentReference? userRef,
  DocumentReference? groupRef,
  DocumentReference? addedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isAdmin': isAdmin,
      'isPlayer': isPlayer,
      'name': name,
      'photoUrl': photoUrl,
      'memberStatus': memberStatus,
      'invitedIn': invitedIn,
      'acceptedIn': acceptedIn,
      'userRef': userRef,
      'groupRef': groupRef,
      'addedBy': addedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class MembersRecordDocumentEquality implements Equality<MembersRecord> {
  const MembersRecordDocumentEquality();

  @override
  bool equals(MembersRecord? e1, MembersRecord? e2) {
    return e1?.isAdmin == e2?.isAdmin &&
        e1?.isPlayer == e2?.isPlayer &&
        e1?.name == e2?.name &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.memberStatus == e2?.memberStatus &&
        e1?.invitedIn == e2?.invitedIn &&
        e1?.acceptedIn == e2?.acceptedIn &&
        e1?.userRef == e2?.userRef &&
        e1?.groupRef == e2?.groupRef &&
        e1?.addedBy == e2?.addedBy;
  }

  @override
  int hash(MembersRecord? e) => const ListEquality().hash([
        e?.isAdmin,
        e?.isPlayer,
        e?.name,
        e?.photoUrl,
        e?.memberStatus,
        e?.invitedIn,
        e?.acceptedIn,
        e?.userRef,
        e?.groupRef,
        e?.addedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is MembersRecord;
}
