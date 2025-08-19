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

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "surfaceType" field.
  SurfaceType? _surfaceType;
  SurfaceType? get surfaceType => _surfaceType;
  bool hasSurfaceType() => _surfaceType != null;

  // "matchAdmins" field.
  List<String>? _matchAdmins;
  List<String> get matchAdmins => _matchAdmins ?? const [];
  bool hasMatchAdmins() => _matchAdmins != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "editingBy" field.
  DocumentReference? _editingBy;
  DocumentReference? get editingBy => _editingBy;
  bool hasEditingBy() => _editingBy != null;

  // "editingByName" field.
  String? _editingByName;
  String get editingByName => _editingByName ?? '';
  bool hasEditingByName() => _editingByName != null;

  // "editingAt" field.
  DateTime? _editingAt;
  DateTime? get editingAt => _editingAt;
  bool hasEditingAt() => _editingAt != null;

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
    _location = snapshotData['location'] as LatLng?;
    _locationName = snapshotData['locationName'] as String?;
    _groupName = snapshotData['groupName'] as String?;
    _surfaceType = snapshotData['surfaceType'] is SurfaceType
        ? snapshotData['surfaceType']
        : deserializeEnum<SurfaceType>(snapshotData['surfaceType']);
    _matchAdmins = getDataList(snapshotData['matchAdmins']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _editingBy = snapshotData['editingBy'] as DocumentReference?;
    _editingByName = snapshotData['editingByName'] as String?;
    _editingAt = snapshotData['editingAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Matches');

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
  LatLng? location,
  String? locationName,
  String? groupName,
  SurfaceType? surfaceType,
  DocumentReference? createdBy,
  DocumentReference? editingBy,
  String? editingByName,
  DateTime? editingAt,
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
      'location': location,
      'locationName': locationName,
      'groupName': groupName,
      'surfaceType': surfaceType,
      'createdBy': createdBy,
      'editingBy': editingBy,
      'editingByName': editingByName,
      'editingAt': editingAt,
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
        e1?.createdFromRecurrence == e2?.createdFromRecurrence &&
        e1?.location == e2?.location &&
        e1?.locationName == e2?.locationName &&
        e1?.groupName == e2?.groupName &&
        e1?.surfaceType == e2?.surfaceType &&
        listEquality.equals(e1?.matchAdmins, e2?.matchAdmins) &&
        e1?.createdBy == e2?.createdBy &&
        e1?.editingBy == e2?.editingBy &&
        e1?.editingByName == e2?.editingByName &&
        e1?.editingAt == e2?.editingAt;
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
        e?.createdFromRecurrence,
        e?.location,
        e?.locationName,
        e?.groupName,
        e?.surfaceType,
        e?.matchAdmins,
        e?.createdBy,
        e?.editingBy,
        e?.editingByName,
        e?.editingAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
