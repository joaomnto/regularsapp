import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sheet_player_widget.dart' show SheetPlayerWidget;
import 'package:flutter/material.dart';

class SheetPlayerModel extends FlutterFlowModel<SheetPlayerWidget> {
  ///  Local state fields for this component.

  bool isPlayer = true;

  bool isAdmin = false;

  bool editMode = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for adminSwitch widget.
  bool? adminSwitchValue;
  // State field(s) for playerSwitch widget.
  bool? playerSwitchValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchesRecord>? matchesToRemovUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
