import '/components/row_attendance_indicator/row_attendance_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'row_match_day_copy_widget.dart' show RowMatchDayCopyWidget;
import 'package:flutter/material.dart';

class RowMatchDayCopyModel extends FlutterFlowModel<RowMatchDayCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for rowAttendanceIndicator component.
  late RowAttendanceIndicatorModel rowAttendanceIndicatorModel;

  @override
  void initState(BuildContext context) {
    rowAttendanceIndicatorModel =
        createModel(context, () => RowAttendanceIndicatorModel());
  }

  @override
  void dispose() {
    rowAttendanceIndicatorModel.dispose();
  }
}
