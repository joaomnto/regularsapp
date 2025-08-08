import '/flutter_flow/flutter_flow_util.dart';
import 'page_search_user_widget.dart' show PageSearchUserWidget;
import 'package:flutter/material.dart';

class PageSearchUserModel extends FlutterFlowModel<PageSearchUserWidget> {
  ///  Local state fields for this page.
  /// Text to query user database
  String? searchQueryText = '';

  ///  State fields for stateful widgets in this page.

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
