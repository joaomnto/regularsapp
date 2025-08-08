import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'page_create_match_widget.dart' show PageCreateMatchWidget;
import 'package:flutter/material.dart';

class PageCreateMatchModel extends FlutterFlowModel<PageCreateMatchWidget> {
  ///  Local state fields for this page.

  String? matchType;

  String? venue;

  String? subs;

  bool isRecurring = false;

  List<MatchAttendanceStruct> tempAttendanceList = [];
  void addToTempAttendanceList(MatchAttendanceStruct item) =>
      tempAttendanceList.add(item);
  void removeFromTempAttendanceList(MatchAttendanceStruct item) =>
      tempAttendanceList.remove(item);
  void removeAtIndexFromTempAttendanceList(int index) =>
      tempAttendanceList.removeAt(index);
  void insertAtIndexInTempAttendanceList(
          int index, MatchAttendanceStruct item) =>
      tempAttendanceList.insert(index, item);
  void updateTempAttendanceListAtIndex(
          int index, Function(MatchAttendanceStruct) updateFn) =>
      tempAttendanceList[index] = updateFn(tempAttendanceList[index]);

  DateTime? selectedDate;

  DateTime? selectedTime;

  LatLng? selectedLocation;

  double selectedDuration = 90.0;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for matchTypeDropDown widget.
  String? matchTypeDropDownValue;
  FormFieldController<String>? matchTypeDropDownValueController;
  // State field(s) for venueDropDown widget.
  String? venueDropDownValue;
  FormFieldController<String>? venueDropDownValueController;
  // State field(s) for subsDropDown widget.
  String? subsDropDownValue;
  FormFieldController<String>? subsDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MembersRecord>? membersList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
