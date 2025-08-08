import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_create_player_widget.dart' show PageCreatePlayerWidget;
import 'package:flutter/material.dart';

class PageCreatePlayerModel extends FlutterFlowModel<PageCreatePlayerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MembersRecord? createdMember;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchesRecord>? futureMatchesInGroup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
