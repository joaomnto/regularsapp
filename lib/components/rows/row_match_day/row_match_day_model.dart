import '/components/row_attendance_indicator/row_attendance_indicator_widget.dart';
import '/components/rows/component_match_detail/component_match_detail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'row_match_day_widget.dart' show RowMatchDayWidget;
import 'package:flutter/material.dart';

class RowMatchDayModel extends FlutterFlowModel<RowMatchDayWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for rowAttendanceIndicator component.
  late RowAttendanceIndicatorModel rowAttendanceIndicatorModel;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel1;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel2;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel3;

  @override
  void initState(BuildContext context) {
    rowAttendanceIndicatorModel =
        createModel(context, () => RowAttendanceIndicatorModel());
    componentMatchDetailModel1 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel2 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel3 =
        createModel(context, () => ComponentMatchDetailModel());
  }

  @override
  void dispose() {
    rowAttendanceIndicatorModel.dispose();
    componentMatchDetailModel1.dispose();
    componentMatchDetailModel2.dispose();
    componentMatchDetailModel3.dispose();
  }
}
