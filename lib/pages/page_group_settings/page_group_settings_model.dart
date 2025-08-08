import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_group_settings_widget.dart' show PageGroupSettingsWidget;
import 'package:flutter/material.dart';

class PageGroupSettingsModel extends FlutterFlowModel<PageGroupSettingsWidget> {
  ///  Local state fields for this page.

  String? groupName;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchesRecord>? matchesToRemoveUserFrom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
