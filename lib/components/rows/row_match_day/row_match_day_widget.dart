import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/pickers/picker_attendance/picker_attendance_widget.dart';
import '/components/pickers/picker_map/picker_map_widget.dart';
import '/components/row_attendance_indicator/row_attendance_indicator_widget.dart';
import '/components/rows/component_match_detail/component_match_detail_widget.dart';
import '/components/sheets/sheet_match/sheet_match_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_match_day_model.dart';
export 'row_match_day_model.dart';

class RowMatchDayWidget extends StatefulWidget {
  const RowMatchDayWidget({
    super.key,
    bool? showGroup,
    bool? isAdmin,
    required this.match,
  })  : this.showGroup = showGroup ?? false,
        this.isAdmin = isAdmin ?? false;

  final bool showGroup;
  final bool isAdmin;
  final MatchesRecord? match;

  @override
  State<RowMatchDayWidget> createState() => _RowMatchDayWidgetState();
}

class _RowMatchDayWidgetState extends State<RowMatchDayWidget> {
  late RowMatchDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowMatchDayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.94,
                child: SheetMatchWidget(
                  matchRef: widget.match?.reference,
                  userIsAdmin: widget.isAdmin,
                  grouRef: widget.match?.groupRef,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      onLongPress: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: PickerAttendanceWidget(
                matchRef: widget.match!.reference,
                matchAttendanceList: widget.match!.attendance,
                playerMatchAttendance:
                    functions.getUserAttendanceFromMatchAttendanceListWithRefId(
                        widget.match?.attendance.toList(),
                        currentUserReference)!,
                isSelf: true,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.match?.status == MatchStatus.Running
                ? FlutterFlowTheme.of(context).secondaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Color(0x19000000),
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).rowStroke,
              width: 1.0,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: AutoSizeText(
                                  functions.smartDateFormat(
                                      widget.match?.matchDate),
                                  maxLines: 1,
                                  minFontSize: 20.0,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.figtree(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'Kick-off at ${dateTimeFormat(
                                        "Hm",
                                        widget.match?.matchDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.figtree(
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 2.0)),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Visibility(
                            visible: widget.match?.groupName != null &&
                                widget.match?.groupName != '',
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 4.0, 6.0, 4.0),
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
                                          .primaryText,
                                      fontSize: 9.0,
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
                        ),
                      ].divide(SizedBox(width: 6.0)),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.match?.location != null) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PickerMapWidget(
                                  location: widget.match!.location!,
                                  locationName: widget.match?.locationName,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: FlutterFlowTheme.of(context).backButtons,
                            size: 14.0,
                          ),
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.match?.locationName,
                                '-',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .backButtons,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (false)
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF250652),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    wrapWithModel(
                                      model: _model.componentMatchDetailModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ComponentMatchDetailWidget(
                                        text: valueOrDefault<String>(
                                          functions.matchTypeToString(
                                              widget.match?.type),
                                          '-',
                                        ),
                                        icon: Icon(
                                          Icons.sports_soccer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                        editMode: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.componentMatchDetailModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ComponentMatchDetailWidget(
                                        text: valueOrDefault<String>(
                                          '${functions.doubleToIntString(widget.match?.duration)} min',
                                          '-',
                                        ),
                                        icon: Icon(
                                          Icons.timer_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                        editMode: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.componentMatchDetailModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ComponentMatchDetailWidget(
                                        text: valueOrDefault<String>(
                                          widget.match?.venue?.name,
                                          '-',
                                        ),
                                        icon: Icon(
                                          Icons.wb_sunny_outlined,
                                          color: Color(0xFFA37FD6),
                                        ),
                                        editMode: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (functions
                                  .matchIsFuture(widget.match!.matchDate!))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
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
                                                        AttendanceStatus
                                                            .attending)
                                                    .toList()
                                                    .length
                                                    .toString(),
                                                '-',
                                              )}/${valueOrDefault<String>(
                                                widget
                                                    .match?.attendance.length
                                                    .toString(),
                                                '-',
                                              )}',
                                              '0/0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.figtree(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    widget.match?.status ==
                                                            MatchStatus
                                                                .Cancelled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 2.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 18.0,
                                      height: 18.0,
                                      decoration: BoxDecoration(),
                                      child: wrapWithModel(
                                        model:
                                            _model.rowAttendanceIndicatorModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: RowAttendanceIndicatorWidget(
                                          attendance: functions
                                              .authUserAttendanceForMatch(
                                                  widget.match?.attendance
                                                      .toList(),
                                                  currentUserReference),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 10.0))
                      .addToStart(SizedBox(height: 8.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
