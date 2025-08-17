import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'groups_list_widget.dart' show GroupsListWidget;
import 'package:flutter/material.dart';

class GroupsListModel extends FlutterFlowModel<GroupsListWidget> {
  ///  Local state fields for this component.

  int groupsListLenght = 0;

  GroupsRecord? groups;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in RowGroup widget.
  GroupsRecord? fetchedGroup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
