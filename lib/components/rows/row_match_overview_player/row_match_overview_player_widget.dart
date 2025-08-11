import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/pickers/picker_attendance/picker_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_match_overview_player_model.dart';
export 'row_match_overview_player_model.dart';

class RowMatchOverviewPlayerWidget extends StatefulWidget {
  const RowMatchOverviewPlayerWidget({
    super.key,
    this.playerAttendanceInMatch,
    this.attendanceStatus,
    this.attendanceList,
    required this.matchRef,
    this.playerUserRef,
    bool? userIsAdmin,
    bool? matchIsInTheFuture,
    bool? isSelf,
    required this.photoURL,
    bool? isLastItem,
  })  : this.userIsAdmin = userIsAdmin ?? false,
        this.matchIsInTheFuture = matchIsInTheFuture ?? false,
        this.isSelf = isSelf ?? false,
        this.isLastItem = isLastItem ?? false;

  final MatchAttendanceStruct? playerAttendanceInMatch;
  final AttendanceStatus? attendanceStatus;
  final List<MatchAttendanceStruct>? attendanceList;
  final DocumentReference? matchRef;
  final DocumentReference? playerUserRef;
  final bool userIsAdmin;
  final bool matchIsInTheFuture;
  final bool isSelf;
  final String? photoURL;
  final bool isLastItem;

  @override
  State<RowMatchOverviewPlayerWidget> createState() =>
      _RowMatchOverviewPlayerWidgetState();
}

class _RowMatchOverviewPlayerWidgetState
    extends State<RowMatchOverviewPlayerWidget> {
  late RowMatchOverviewPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowMatchOverviewPlayerModel());

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
        if ((widget.playerUserRef?.id == currentUserReference?.id) ||
            ((widget.userIsAdmin == true) &&
                (widget.playerUserRef == null))) {
          if (widget.matchIsInTheFuture) {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: PickerAttendanceWidget(
                    playerMatchAttendance: widget.playerAttendanceInMatch!,
                    matchRef: widget.matchRef!,
                    matchAttendanceList: widget.attendanceList!,
                    isSelf: widget.playerUserRef == currentUserReference,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          } else {
            return;
          }
        } else {
          return;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            !widget.isSelf
                ? FlutterFlowTheme.of(context).secondaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 22.0, 16.0, 22.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 500),
                      imageUrl: widget.photoURL!,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.fill,
                      errorWidget: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        width: 25.0,
                        height: 25.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.playerAttendanceInMatch?.player.name,
                              'Player',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.lexendDeca(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .textMatchingPrimary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      if (functions.memberAttendanceForMatch(
                              widget.playerAttendanceInMatch) ==
                          AttendanceStatus.attending)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).success,
                            size: 22.0,
                          ),
                        ),
                      if (functions.memberAttendanceForMatch(
                              widget.playerAttendanceInMatch) ==
                          AttendanceStatus.notAttending)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.cancel_sharp,
                            color: FlutterFlowTheme.of(context).error,
                            size: 22.0,
                          ),
                        ),
                      if (functions.memberAttendanceForMatch(
                              widget.playerAttendanceInMatch) ==
                          AttendanceStatus.noReply)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.question_mark,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 22.0,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (!widget.isLastItem)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).listRowSeparator,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
