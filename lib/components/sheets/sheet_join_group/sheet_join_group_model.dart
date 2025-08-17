import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sheet_join_group_widget.dart' show SheetJoinGroupWidget;
import 'package:flutter/material.dart';

class SheetJoinGroupModel extends FlutterFlowModel<SheetJoinGroupWidget> {
  ///  Local state fields for this component.

  GroupJoinCodesRecord? groupJoinDoc;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GroupJoinCodesRecord? groupFound;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JoinRequestsRecord? createdJoinRequest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
