import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'page_match_edit_widget.dart' show PageMatchEditWidget;
import 'package:flutter/material.dart';

class PageMatchEditModel extends FlutterFlowModel<PageMatchEditWidget> {
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

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for RecurringSwitch widget.
  bool? recurringSwitchValue;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for MatchTypePicker widget.
  FormFieldController<List<String>>? matchTypePickerValueController;
  String? get matchTypePickerValue =>
      matchTypePickerValueController?.value?.firstOrNull;
  set matchTypePickerValue(String? val) =>
      matchTypePickerValueController?.value = val != null ? [val] : [];
  // State field(s) for VenueTypePicker widget.
  FormFieldController<List<String>>? venueTypePickerValueController;
  String? get venueTypePickerValue =>
      venueTypePickerValueController?.value?.firstOrNull;
  set venueTypePickerValue(String? val) =>
      venueTypePickerValueController?.value = val != null ? [val] : [];
  // State field(s) for SubsPicker widget.
  FormFieldController<List<String>>? subsPickerValueController;
  String? get subsPickerValue => subsPickerValueController?.value?.firstOrNull;
  set subsPickerValue(String? val) =>
      subsPickerValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
