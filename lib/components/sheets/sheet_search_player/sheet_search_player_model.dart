import '/flutter_flow/flutter_flow_util.dart';
import 'sheet_search_player_widget.dart' show SheetSearchPlayerWidget;
import 'package:flutter/material.dart';

class SheetSearchPlayerModel extends FlutterFlowModel<SheetSearchPlayerWidget> {
  ///  Local state fields for this component.

  String? searchQueryText;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
