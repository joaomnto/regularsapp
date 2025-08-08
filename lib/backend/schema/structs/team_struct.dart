// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Team on a Match
class TeamStruct extends FFFirebaseStruct {
  TeamStruct({
    String? name,
    Color? color,
    List<EmbeddedPlayerStruct>? players,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _color = color,
        _players = players,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "players" field.
  List<EmbeddedPlayerStruct>? _players;
  List<EmbeddedPlayerStruct> get players => _players ?? const [];
  set players(List<EmbeddedPlayerStruct>? val) => _players = val;

  void updatePlayers(Function(List<EmbeddedPlayerStruct>) updateFn) {
    updateFn(_players ??= []);
  }

  bool hasPlayers() => _players != null;

  static TeamStruct fromMap(Map<String, dynamic> data) => TeamStruct(
        name: data['name'] as String?,
        color: getSchemaColor(data['color']),
        players: getStructList(
          data['players'],
          EmbeddedPlayerStruct.fromMap,
        ),
      );

  static TeamStruct? maybeFromMap(dynamic data) =>
      data is Map ? TeamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'color': _color,
        'players': _players?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'players': serializeParam(
          _players,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TeamStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        players: deserializeStructParam<EmbeddedPlayerStruct>(
          data['players'],
          ParamType.DataStruct,
          true,
          structBuilder: EmbeddedPlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TeamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TeamStruct &&
        name == other.name &&
        color == other.color &&
        listEquality.equals(players, other.players);
  }

  @override
  int get hashCode => const ListEquality().hash([name, color, players]);
}

TeamStruct createTeamStruct({
  String? name,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamStruct(
      name: name,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamStruct? updateTeamStruct(
  TeamStruct? team, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    team
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamStructData(
  Map<String, dynamic> firestoreData,
  TeamStruct? team,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (team == null) {
    return;
  }
  if (team.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && team.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamData = getTeamFirestoreData(team, forFieldValue);
  final nestedData = teamData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = team.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamFirestoreData(
  TeamStruct? team, [
  bool forFieldValue = false,
]) {
  if (team == null) {
    return {};
  }
  final firestoreData = mapToFirestore(team.toMap());

  // Add any Firestore field values
  team.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamListFirestoreData(
  List<TeamStruct>? teams,
) =>
    teams?.map((e) => getTeamFirestoreData(e, true)).toList() ?? [];
