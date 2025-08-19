import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/row_attendance_indicator/row_attendance_indicator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_match_model.dart';
export 'row_match_model.dart';

class RowMatchWidget extends StatefulWidget {
  const RowMatchWidget({
    super.key,
    this.matchStatus,
    this.matchDate,
    this.kickofftime,
    required this.match,
    bool? showGroup,
    required this.playerAttendanceInMatch,
  }) : this.showGroup = showGroup ?? false;

  final MatchStatus? matchStatus;
  final DateTime? matchDate;
  final DateTime? kickofftime;
  final MatchesRecord? match;
  final bool showGroup;
  final AttendanceStatus? playerAttendanceInMatch;

  @override
  State<RowMatchWidget> createState() => _RowMatchWidgetState();
}

class _RowMatchWidgetState extends State<RowMatchWidget> {
  late RowMatchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowMatchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.showGroup ? 98.0 : 98.0,
      decoration: BoxDecoration(
        color: widget.matchStatus == MatchStatus.Running
            ? FlutterFlowTheme.of(context).secondaryBackground
            : FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Color(0x19000000),
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).rowStroke,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 4.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: () {
                  if (widget.matchStatus == MatchStatus.Cancelled) {
                    return FlutterFlowTheme.of(context).alternate;
                  } else if (widget.matchStatus == MatchStatus.Finished) {
                    return FlutterFlowTheme.of(context).alternate;
                  } else {
                    return FlutterFlowTheme.of(context).primary;
                  }
                }(),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 2.0, 0.0, 2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              functions.smartDateFormat(widget.matchDate),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: () {
                                      if (widget.matchStatus ==
                                          MatchStatus.Cancelled) {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      } else if (widget.matchStatus ==
                                          MatchStatus.Finished) {
                                        return FlutterFlowTheme.of(context)
                                            .textMatchingPrimary;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .textMatchingPrimary;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        if (widget.showGroup &&
                            (widget.match?.groupName != null &&
                                widget.match?.groupName != ''))
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                widget.match!.groupName,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.matchStatus == MatchStatus.Running
                                  ? functions.matchTimeStringForStartDate(
                                      widget.matchDate)!
                                  : valueOrDefault<String>(
                                      dateTimeFormat(
                                        "Hm",
                                        widget.matchDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '13h30',
                                    ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                            if (widget.matchStatus == MatchStatus.Cancelled)
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 2.0, 4.0, 2.0),
                                  child: Text(
                                    'canceled',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        if (functions.matchIsFuture(widget.matchDate!))
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 4.0, 6.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            widget.match?.attendance
                                                .where((e) =>
                                                    e.status ==
                                                    AttendanceStatus.attending)
                                                .toList()
                                                .length
                                                .toString(),
                                            '0',
                                          )}/${widget.match?.attendance.length.toString()}',
                                          '0/0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: widget.matchStatus ==
                                                      MatchStatus.Cancelled
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 2.0)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.rowAttendanceIndicatorModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowAttendanceIndicatorWidget(
                                    attendance: widget.playerAttendanceInMatch,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
