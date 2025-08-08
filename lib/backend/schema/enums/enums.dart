import 'package:collection/collection.dart';

enum PlayerPosition {
  GK,
  CB,
  RB,
  LB,
  DF,
  CMD,
  AM,
  LW,
  RW,
  ST,
}

enum MatchStatus {
  Scheduled,
  Running,
  Finished,
  Postponed,
  Cancelled,
}

enum AttendanceStatus {
  attending,
  noReply,
  notAttending,
}

/// Property describing the status of a member in a group
enum MemberStatus {
  Invited,
  Accepted,
  Declined,
}

enum MatchType {
  Five,
  Seven,
  Eleven,
}

enum SubsType {
  NoSubs,
  Max3,
  Unlimited,
}

enum VenueType {
  Outdoors,
  Indoors,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PlayerPosition):
      return PlayerPosition.values.deserialize(value) as T?;
    case (MatchStatus):
      return MatchStatus.values.deserialize(value) as T?;
    case (AttendanceStatus):
      return AttendanceStatus.values.deserialize(value) as T?;
    case (MemberStatus):
      return MemberStatus.values.deserialize(value) as T?;
    case (MatchType):
      return MatchType.values.deserialize(value) as T?;
    case (SubsType):
      return SubsType.values.deserialize(value) as T?;
    case (VenueType):
      return VenueType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
