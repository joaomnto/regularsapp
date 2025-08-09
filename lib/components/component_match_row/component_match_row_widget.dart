import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component_match_row_model.dart';
export 'component_match_row_model.dart';

class ComponentMatchRowWidget extends StatefulWidget {
  const ComponentMatchRowWidget({
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
  State<ComponentMatchRowWidget> createState() =>
      _ComponentMatchRowWidgetState();
}

class _ComponentMatchRowWidgetState extends State<ComponentMatchRowWidget> {
  late ComponentMatchRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentMatchRowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GroupsRecord>(
      future: GroupsRecord.getDocumentOnce(widget.match!.parentReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }

        final orderCardGroupsRecord = snapshot.data!;

        return Container(
          height: 90.0,
          decoration: BoxDecoration(
            color: widget.matchStatus == MatchStatus.Running
                ? FlutterFlowTheme.of(context).secondaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 4.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      functions.colorForStatus(widget.matchStatus),
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              functions.matchStatusDisplayStringForStatus(
                                  widget.matchStatus!),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.lexendDeca(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: valueOrDefault<Color>(
                                      functions.colorForStatus(
                                          widget.match?.status),
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            if (widget.showGroup)
                              Text(
                                orderCardGroupsRecord.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.lexendDeca(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: widget.matchStatus ==
                                              MatchStatus.Running
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                          ],
                        ),
                        Text(
                          functions.smartDateFormat(widget.matchDate),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.lexendDeca(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: widget.matchStatus ==
                                        MatchStatus.Running
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).primaryText,
                                fontSize: 26.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
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
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.lexendDeca(
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
                                                MatchStatus.Running
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Stack(
                              children: [
                                if (widget.playerAttendanceInMatch ==
                                    AttendanceStatus.attending)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      size: 20.0,
                                    ),
                                  ),
                                if (widget.playerAttendanceInMatch ==
                                    AttendanceStatus.notAttending)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Icon(
                                      Icons.cancel,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 20.0,
                                    ),
                                  ),
                                if ((widget.playerAttendanceInMatch ==
                                        AttendanceStatus.noReply) &&
                                    functions.matchIsFuture(widget.matchDate!))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Icon(
                                      Icons.question_mark_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 20.0,
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
      },
    );
  }
}
