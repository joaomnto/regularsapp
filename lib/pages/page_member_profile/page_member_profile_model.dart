import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_member_profile_widget.dart' show PageMemberProfileWidget;
import 'package:flutter/material.dart';

class PageMemberProfileModel extends FlutterFlowModel<PageMemberProfileWidget> {
  ///  Local state fields for this page.

  bool isPlayer = false;

  bool isAdmin = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchesRecord>? matchesToRemoveUserFrom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
