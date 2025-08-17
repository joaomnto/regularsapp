import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'row_request_to_join_widget.dart' show RowRequestToJoinWidget;
import 'package:flutter/material.dart';

class RowRequestToJoinModel extends FlutterFlowModel<RowRequestToJoinWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MembersRecord? createdMember;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchesRecord>? futureMatchesInGroup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
