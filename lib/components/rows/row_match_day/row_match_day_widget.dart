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
    this.match,
    bool? showGroup,
    bool? isAdmin,
  })  : this.showGroup = showGroup ?? false,
        this.isAdmin = isAdmin ?? false;

  final MatchesRecord? match;
  final bool showGroup;
  final bool isAdmin;

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
                  grouRef: widget.match!.groupRef!,
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
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.match?.status == MatchStatus.Running
                ? FlutterFlowTheme.of(context).secondaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/grass_bg.png',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: Color(0x19000000),
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xD6FFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                functions
                                    .smartDateFormat(widget.match?.matchDate),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget.match?.groupName,
                                '-',
                              ),
                              minFontSize: 8.0,
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                'Kick-off at ${dateTimeFormat(
                                                  "Hm",
                                                  widget.match?.matchDate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                                '-',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget.match?.location !=
                                                null) {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: PickerMapWidget(
                                                      location: widget
                                                          .match!.location!,
                                                      locationName: widget
                                                          .match?.locationName,
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 18.0,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.match?.locationName,
                                                    ' -',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.figtree(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 6.0)),
                                    ),
                                  ),
                                ),
                                if (functions
                                    .matchIsFuture(widget.match!.matchDate!))
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                  '0',
                                                )}/${widget.match?.attendance.length.toString()}',
                                                '0/0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.match?.status ==
                                                              MatchStatus
                                                                  .Cancelled
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          model: _model
                                              .rowAttendanceIndicatorModel,
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
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
