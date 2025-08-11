import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatMatchStatus(int? status) {
  throw Exception("Test iOS crash");

  switch (status) {
    case 0:
      return 'Scheduled';
    case 1:
      return 'Now Playing';
    case 2:
      return 'Cancelled';
    case 3:
      return 'Postponed';
    case 4:
      return 'Finished';
    default:
      return 'Scheduled';
  }
}

AttendanceStatus? memberAttendanceForMatch(MatchAttendanceStruct? attendance) {
  return attendance?.status;
}

Color colorForStatus(MatchStatus? matchStatus) {
  switch (matchStatus) {
    case MatchStatus.Scheduled:
      return Color(0xFF2196F3);
    case MatchStatus.Running:
      return Color(0xFF4CAF50);
    case MatchStatus.Finished:
      return Color(0xFF9E9E9E);
    case MatchStatus.Postponed:
      return Color(0xFFFF9800);
    case MatchStatus.Cancelled:
      return Color(0xFFF44336);
    default:
      return Color(0xFF9E9E9E);
  }
}

AttendanceStatus? authUserAttendanceForMatch(
  List<MatchAttendanceStruct>? matchAttendanceList,
  DocumentReference? currentUser,
) {
  if (matchAttendanceList == null || currentUser == null) return null;

  for (final attendance in matchAttendanceList) {
    final playerRef = attendance.player?.userRefId;

    if (playerRef != null && playerRef == currentUser) {
      return attendance.status;
    }
  }
  return AttendanceStatus.noReply; // Not found
}

SubsType? stringToSubsType(String? subsTypeString) {
  if (subsTypeString == null || subsTypeString.isEmpty) return null;

  return SubsType.values.firstWhere((e) => e.name == subsTypeString);
}

MatchType? stringToMatchType(String? matchTypeString) {
  if (matchTypeString == null ||
      matchTypeString.isEmpty ||
      matchTypeString == 'Undefined') return null;

  return MatchType.values.firstWhere((e) => e.name == matchTypeString);
}

VenueType? stringToVenueType(String? venueTypeString) {
  if (venueTypeString == null || venueTypeString.isEmpty) return null;
  return VenueType.values.firstWhere((e) => e.name == venueTypeString);
}

bool hasNotAttendingPlayer(List<MatchAttendanceStruct>? attendanceList) {
  if (attendanceList == null) return false;

  for (final attendance in attendanceList) {
    if (attendance.status == AttendanceStatus.notAttending) {
      return true;
    }
  }
  return false;
}

DateTime? combineDateAndTime(
  DateTime? date,
  DateTime? time,
) {
  if (date == null || time == null) return null;

  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}

String smartDateFormat(DateTime? date) {
  if (date == null) return '—';

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(Duration(days: 1));
  final inputDate = DateTime(date.year, date.month, date.day);

  if (inputDate == today) {
    return 'Today';
  } else if (inputDate == tomorrow) {
    return 'Tomorrow';
  } else if (inputDate.isBefore(today.add(Duration(days: 7))) &&
      inputDate.weekday > now.weekday) {
    // Same week, future day
    return DateFormat('EEEE').format(date); // e.g. "Thursday"
  } else {
    return DateFormat('EEE, MMM d').format(date); // e.g. "Fri, Aug 8"
  }
}

bool userIsAdminInGroup(
  DocumentReference? userRef,
  List<MembersRecord>? membersList,
) {
  if (membersList == null || userRef == null) {
    return false;
  }

  for (final m in membersList) {
    print('- ${m.userRef?.path ?? 'null'}');
    if (m.userRef == userRef && m.isAdmin == true) {
      return true;
    }
  }

  return false;
}

List<MatchAttendanceStruct> updateAttendanceList(
  List<MatchAttendanceStruct>? originalList,
  MatchAttendanceStruct? updatedAttendance,
) {
  if (originalList == null || updatedAttendance == null) {
    return originalList ?? [];
  }

  List<MatchAttendanceStruct> updatedList = [];

  for (final item in originalList) {
    print('- ${item.player.memberRefId} | status: ${item.status}');
  }

  for (final item in originalList) {
    final existingRef = item.player.memberRefId;
    final updatedRef = updatedAttendance.player.memberRefId;

    if (existingRef != null &&
        updatedRef != null &&
        existingRef == updatedRef) {
      updatedList.add(updatedAttendance);
    } else {
      updatedList.add(item);
    }
  }

  return updatedList;
}

MatchAttendanceStruct? getUserAttendanceFromMatchAttendanceListWithRefId(
  List<MatchAttendanceStruct>? attendanceList,
  DocumentReference? userRef,
) {
  print('🔍 getMyAttendance triggered');

  if (attendanceList == null) {
    return null;
  }

  if (userRef == null) {
    return null;
  }

  if (attendanceList == null || userRef == null) return null;

  for (final item in attendanceList) {
    if (item.player?.userRefId == userRef) {
      return item;
    }
  }
  return null;
}

MatchAttendanceStruct? getUserAttendanceFromMatchAttendanceList(
  List<MatchAttendanceStruct>? attendanceList,
  DocumentReference? memberRef,
) {
  print('🔍 getMyAttendance triggered');

  if (attendanceList == null) {
    return null;
  }

  if (memberRef == null) {
    return null;
  }

  if (attendanceList == null || memberRef == null) return null;

  for (final item in attendanceList) {
    if (item.player?.memberRefId == memberRef) {
      return item;
    }
  }
  return null;
}

bool matchIsFuture(DateTime matchDate) {
  final now = DateTime.now();
  return matchDate.isAtSameMomentAs(now) || matchDate.isAfter(now);
}

String? matchTypeToString(MatchType? matchType) {
  switch (matchType) {
    case MatchType.Five:
      return '5 v 5';
    case MatchType.Seven:
      return '7 v 7';
    case MatchType.Eleven:
      return '11 v 11';
    default:
      return null;
  }
}

List<MatchAttendanceStruct>? filterOutAuthUserFromAttendance(
  List<MatchAttendanceStruct>? attendanceList,
  DocumentReference? userRef,
) {
  if (attendanceList == null) return [];

  // 1. Remove auth user
  final filtered = attendanceList.where((item) {
    final playerRef = item.player?.userRefId;
    if (playerRef == null) return true; // keep items with no refId
    return playerRef != userRef; // remove only if it matches auth user
  }).toList();

  // 2. Sort by status (custom order)
  final statusOrder = {
    AttendanceStatus.attending: 0,
    AttendanceStatus.notAttending: 1,
    AttendanceStatus.noReply: 2,
  };

  filtered.sort((a, b) {
    final aOrder = statusOrder[a.status] ?? 999;
    final bOrder = statusOrder[b.status] ?? 999;
    return aOrder.compareTo(bOrder);
  });

  return filtered;
}

List<DocumentReference>? removeMemberFromList(
  List<DocumentReference>? members,
  DocumentReference memberToRemove,
) {
  if (members == null) return [];
  return members.where((ref) => ref.id != memberToRemove.id).toList();
}

bool hasUserInAttendanceList(
  List<MatchAttendanceStruct>? attendanceList,
  DocumentReference? userRef,
) {
  if (attendanceList == null || userRef == null) return false;

  for (final attendance in attendanceList) {
    final playerUserRef = attendance.player.userRefId;
    if (playerUserRef != null && playerUserRef == userRef) {
      return true;
    }
  }

  return false;
}

List<DocumentReference> memberRefsFromAttendance(
    List<MatchAttendanceStruct>? attendanceList) {
  if (attendanceList == null) return [];

  return attendanceList
      .map((a) => a.player?.memberRefId)
      .whereType<DocumentReference>()
      .toList();
}

List<DocumentReference>? userRefsFromAttendanceList(
    List<MatchAttendanceStruct>? attendanceList) {
  if (attendanceList == null) return [];

  return attendanceList
      .map((a) => a.player?.userRefId) // assuming refId is the userRef
      .whereType<DocumentReference>()
      .toList();
}

List<MatchAttendanceStruct>? attendanceByRemovingAttendant(
  DocumentReference memberRef,
  List<MatchAttendanceStruct>? attendanceList,
) {
  if (attendanceList == null) return [];

  print('!!! Attendance: ${attendanceList}');
  print('!!! memberRef: ${memberRef}');

  return attendanceList
      .where((a) => a.player?.memberRefId?.id != memberRef.id)
      .toList();
}

List<String> matchTypeDisplayStrings(List<MatchType> matchTypes) {
  return matchTypes.map((type) {
    switch (type) {
      case MatchType.Five:
        return '5 v 5';
      case MatchType.Seven:
        return '7 v 7';
      case MatchType.Eleven:
        return '11 v 11';
    }
  }).toList();
}

DateTime? dateTimePlusMinutes(
  double? minutes,
  DateTime date,
) {
  if (minutes == null) return DateTime.now();
  print('Initial date: ${date}');
  print('Minutes to add: ${minutes}');
  print('Final date: ${date.add(Duration(minutes: minutes.toInt()))}');

  return date.add(Duration(minutes: minutes.toInt()));
}

String matchStatusDisplayStringForStatus(MatchStatus status) {
  switch (status) {
    case MatchStatus.Scheduled:
      return 'Scheduled';
    case MatchStatus.Running:
      return 'Now Playing';
    case MatchStatus.Cancelled:
      return 'Cancelled';
    case MatchStatus.Postponed:
      return 'Postponed';
    case MatchStatus.Finished:
      return 'Finished';
  }
}

String? doubleToIntString(double? value) {
  if (value == null) return '';
  return value.toInt().toString();
}

String? matchTimeStringForStartDate(DateTime? matchDate) {
  if (matchDate == null) return '';

  final now = DateTime.now();
  final difference = now.difference(matchDate);
  final minutes = difference.inMinutes;

  if (minutes < 0) return '0′'; // Match hasn’t started yet
  return '$minutes′';
}

String toLowerString(String? s) {
  if (s == null) {
    return '';
  }
  return s.toLowerCase();
}

String? normalizeGoogleAvatar(String? url) {
  if (url == null) return "";
  if (!url.contains('googleusercontent.com')) return url;
  if (url.contains('=s')) {
    return url.replaceAll(RegExp(r'=s\d+-c'), '=s200-c');
  }
  final uri = Uri.parse(url);
  if (uri.queryParameters.containsKey('sz')) {
    return uri.replace(
        queryParameters: {...uri.queryParameters, 'sz': '200'}).toString();
  }
  return url;
}
