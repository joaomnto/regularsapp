import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchesRecord extends FirestoreRecord {
  MatchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "matchDate" field.
  DateTime? _matchDate;
  DateTime? get matchDate => _matchDate;
  bool hasMatchDate() => _matchDate != null;

  // "attendance" field.
  List<MatchAttendanceStruct>? _attendance;
  List<MatchAttendanceStruct> get attendance => _attendance ?? const [];
  bool hasAttendance() => _attendance != null;

  // "status" field.
  MatchStatus? _status;
  MatchStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "venue" field.
  VenueType? _venue;
  VenueType? get venue => _venue;
  bool hasVenue() => _venue != null;

  // "type" field.
  MatchType? _type;
  MatchType? get type => _type;
  bool hasType() => _type != null;

  // "subs" field.
  SubsType? _subs;
  SubsType? get subs => _subs;
  bool hasSubs() => _subs != null;

  // "isRecurring" field.
  bool? _isRecurring;
  bool get isRecurring => _isRecurring ?? false;
  bool hasIsRecurring() => _isRecurring != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "groupRef" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "matchGroupMembers" field.
  List<DocumentReference>? _matchGroupMembers;
  List<DocumentReference> get matchGroupMembers =>
      _matchGroupMembers ?? const [];
  bool hasMatchGroupMembers() => _matchGroupMembers != null;

  // "attendanceUserRefs" field.
  List<DocumentReference>? _attendanceUserRefs;
  List<DocumentReference> get attendanceUserRefs =>
      _attendanceUserRefs ?? const [];
  bool hasAttendanceUserRefs() => _attendanceUserRefs != null;

  // "createdIn" field.
  DateTime? _createdIn;
  DateTime? get createdIn => _createdIn;
  bool hasCreatedIn() => _createdIn != null;

  // "recurringId" field.
  String? _recurringId;
  String get recurringId => _recurringId ?? '';
  bool hasRecurringId() => _recurringId != null;

  // "matchEndDate" field.
  DateTime? _matchEndDate;
  DateTime? get matchEndDate => _matchEndDate;
  bool hasMatchEndDate() => _matchEndDate != null;

  // "createdFromRecurrence" field.
  bool? _createdFromRecurrence;
  bool get createdFromRecurrence => _createdFromRecurrence ?? false;
  bool hasCreatedFromRecurrence() => _createdFromRecurrence != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _matchDate = snapshotData['matchDate'] as DateTime?;
    _attendance = getStructList(
      snapshotData['attendance'],
      MatchAttendanceStruct.fromMap,
    );
    _status = snapshotData['status'] is MatchStatus
        ? snapshotData['status']
        : deserializeEnum<MatchStatus>(snapshotData['status']);
    _venue = snapshotData['venue'] is VenueType
        ? snapshotData['venue']
        : deserializeEnum<VenueType>(snapshotData['venue']);
    _type = snapshotData['type'] is MatchType
        ? snapshotData['type']
        : deserializeEnum<MatchType>(snapshotData['type']);
    _subs = snapshotData['subs'] is SubsType
        ? snapshotData['subs']
        : deserializeEnum<SubsType>(snapshotData['subs']);
    _isRecurring = snapshotData['isRecurring'] as bool?;
    _duration = castToType<double>(snapshotData['duration']);
    _groupRef = snapshotData['groupRef'] as DocumentReference?;
    _matchGroupMembers = getDataList(snapshotData['matchGroupMembers']);
    _attendanceUserRefs = getDataList(snapshotData['attendanceUserRefs']);
    _createdIn = snapshotData['createdIn'] as DateTime?;
    _recurringId = snapshotData['recurringId'] as String?;
    _matchEndDate = snapshotData['matchEndDate'] as DateTime?;
    _createdFromRecurrence = snapshotData['createdFromRecurrence'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Matches')
          : FirebaseFirestore.instance.collectionGroup('Matches');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Matches').doc(id);

  static Stream<MatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesRecord.fromSnapshot(s));

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesRecord.fromSnapshot(s));

  static MatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchesRecordData({
  DateTime? matchDate,
  MatchStatus? status,
  VenueType? venue,
  MatchType? type,
  SubsType? subs,
  bool? isRecurring,
  double? duration,
  DocumentReference? groupRef,
  DateTime? createdIn,
  String? recurringId,
  DateTime? matchEndDate,
  bool? createdFromRecurrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'matchDate': matchDate,
      'status': status,
      'venue': venue,
      'type': type,
      'subs': subs,
      'isRecurring': isRecurring,
      'duration': duration,
      'groupRef': groupRef,
      'createdIn': createdIn,
      'recurringId': recurringId,
      'matchEndDate': matchEndDate,
      'createdFromRecurrence': createdFromRecurrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.matchDate == e2?.matchDate &&
        listEquality.equals(e1?.attendance, e2?.attendance) &&
        e1?.status == e2?.status &&
        e1?.venue == e2?.venue &&
        e1?.type == e2?.type &&
        e1?.subs == e2?.subs &&
        e1?.isRecurring == e2?.isRecurring &&
        e1?.duration == e2?.duration &&
        e1?.groupRef == e2?.groupRef &&
        listEquality.equals(e1?.matchGroupMembers, e2?.matchGroupMembers) &&
        listEquality.equals(e1?.attendanceUserRefs, e2?.attendanceUserRefs) &&
        e1?.createdIn == e2?.createdIn &&
        e1?.recurringId == e2?.recurringId &&
        e1?.matchEndDate == e2?.matchEndDate &&
        e1?.createdFromRecurrence == e2?.createdFromRecurrence;
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.matchDate,
        e?.attendance,
        e?.status,
        e?.venue,
        e?.type,
        e?.subs,
        e?.isRecurring,
        e?.duration,
        e?.groupRef,
        e?.matchGroupMembers,
        e?.attendanceUserRefs,
        e?.createdIn,
        e?.recurringId,
        e?.matchEndDate,
        e?.createdFromRecurrence
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
