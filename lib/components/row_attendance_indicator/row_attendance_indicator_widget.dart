import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'row_attendance_indicator_model.dart';
export 'row_attendance_indicator_model.dart';

class RowAttendanceIndicatorWidget extends StatefulWidget {
  const RowAttendanceIndicatorWidget({
    super.key,
    this.attendance,
  });

  final AttendanceStatus? attendance;

  @override
  State<RowAttendanceIndicatorWidget> createState() =>
      _RowAttendanceIndicatorWidgetState();
}

class _RowAttendanceIndicatorWidgetState
    extends State<RowAttendanceIndicatorWidget> {
  late RowAttendanceIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowAttendanceIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 22.0,
        height: 22.0,
        child: Stack(
          children: [
            if (widget.attendance == AttendanceStatus.attending)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/iconAttending.png',
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.attendance == AttendanceStatus.notAttending)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/iconNotAttending.png',
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.attendance == AttendanceStatus.noReply)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/iconMaybe.png',
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
