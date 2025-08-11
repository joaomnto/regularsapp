import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'row_add_member_widget.dart' show RowAddMemberWidget;
import 'package:flutter/material.dart';

class RowAddMemberModel extends FlutterFlowModel<RowAddMemberWidget> {
  ///  Local state fields for this component.

  String name = 'Player';

  String? photo;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MembersRecord? createdMember;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MatchesRecord>? futureMatchesInGroup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
