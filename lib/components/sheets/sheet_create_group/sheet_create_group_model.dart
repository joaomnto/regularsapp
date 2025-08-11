import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sheet_create_group_widget.dart' show SheetCreateGroupWidget;
import 'package:flutter/material.dart';

class SheetCreateGroupModel extends FlutterFlowModel<SheetCreateGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for groupNameField widget.
  FocusNode? groupNameFieldFocusNode;
  TextEditingController? groupNameFieldTextController;
  String? Function(BuildContext, String?)?
      groupNameFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GroupsRecord? creaatedGroup;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MembersRecord? createdMember;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    groupNameFieldFocusNode?.dispose();
    groupNameFieldTextController?.dispose();
  }
}
