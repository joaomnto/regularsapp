import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'picker_attendance_model.dart';
export 'picker_attendance_model.dart';

class PickerAttendanceWidget extends StatefulWidget {
  const PickerAttendanceWidget({
    super.key,
    required this.matchRef,
    required this.matchAttendanceList,
    required this.playerMatchAttendance,
    bool? isSelf,
  }) : this.isSelf = isSelf ?? false;

  final DocumentReference? matchRef;
  final List<MatchAttendanceStruct>? matchAttendanceList;
  final MatchAttendanceStruct? playerMatchAttendance;
  final bool isSelf;

  @override
  State<PickerAttendanceWidget> createState() => _PickerAttendanceWidgetState();
}

class _PickerAttendanceWidgetState extends State<PickerAttendanceWidget> {
  late PickerAttendanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickerAttendanceModel());

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
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              widget.isSelf
                  ? 'Are you attending?'
                  : 'Is ${widget.playerMatchAttendance?.player.name} attending?',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.figtree(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.matchRef!.update({
                          ...mapToFirestore(
                            {
                              'attendance': getMatchAttendanceListFirestoreData(
                                functions.updateAttendanceList(
                                    widget.matchAttendanceList?.toList(),
                                    MatchAttendanceStruct(
                                      status: AttendanceStatus.attending,
                                      player: EmbeddedPlayerStruct(
                                        name: widget.playerMatchAttendance
                                            ?.player.name,
                                        photoUrl: widget.playerMatchAttendance
                                            ?.player.photoUrl,
                                        userRefId: widget.playerMatchAttendance
                                            ?.player.userRefId,
                                        memberRefId: widget
                                            .playerMatchAttendance
                                            ?.player
                                            .memberRefId,
                                      ),
                                    )),
                              ),
                            },
                          ),
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).success,
                            size: 24.0,
                          ),
                          Text(
                            'Attending',
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
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.matchRef!.update({
                          ...mapToFirestore(
                            {
                              'attendance': getMatchAttendanceListFirestoreData(
                                functions.updateAttendanceList(
                                    widget.matchAttendanceList?.toList(),
                                    MatchAttendanceStruct(
                                      status: AttendanceStatus.notAttending,
                                      player: EmbeddedPlayerStruct(
                                        name: widget.playerMatchAttendance
                                            ?.player.name,
                                        photoUrl: widget.playerMatchAttendance
                                            ?.player.photoUrl,
                                        userRefId: widget.playerMatchAttendance
                                            ?.player.userRefId,
                                        memberRefId: widget
                                            .playerMatchAttendance
                                            ?.player
                                            .memberRefId,
                                      ),
                                    )),
                              ),
                            },
                          ),
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.cancel,
                            color: FlutterFlowTheme.of(context).notAttending,
                            size: 24.0,
                          ),
                          Text(
                            'Not Attending',
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
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.matchRef!.update({
                          ...mapToFirestore(
                            {
                              'attendance': getMatchAttendanceListFirestoreData(
                                functions.updateAttendanceList(
                                    widget.matchAttendanceList?.toList(),
                                    MatchAttendanceStruct(
                                      status: AttendanceStatus.noReply,
                                      player: EmbeddedPlayerStruct(
                                        name: widget.playerMatchAttendance
                                            ?.player.name,
                                        photoUrl: widget.playerMatchAttendance
                                            ?.player.photoUrl,
                                        userRefId: widget.playerMatchAttendance
                                            ?.player.userRefId,
                                        memberRefId: widget
                                            .playerMatchAttendance
                                            ?.player
                                            .memberRefId,
                                      ),
                                    )),
                              ),
                            },
                          ),
                        });
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.question_mark,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Text(
                            'Maybe',
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
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 26.0)),
                ),
              ),
            ),
          ),
        ]
            .divide(SizedBox(height: 16.0))
            .addToStart(SizedBox(height: 16.0))
            .addToEnd(SizedBox(height: 40.0)),
      ),
    );
  }
}
