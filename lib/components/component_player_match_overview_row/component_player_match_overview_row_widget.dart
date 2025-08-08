import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/component_attendance_picker/component_attendance_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component_player_match_overview_row_model.dart';
export 'component_player_match_overview_row_model.dart';

class ComponentPlayerMatchOverviewRowWidget extends StatefulWidget {
  const ComponentPlayerMatchOverviewRowWidget({
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
  })  : this.userIsAdmin = userIsAdmin ?? false,
        this.matchIsInTheFuture = matchIsInTheFuture ?? false,
        this.isSelf = isSelf ?? false;

  final MatchAttendanceStruct? playerAttendanceInMatch;
  final AttendanceStatus? attendanceStatus;
  final List<MatchAttendanceStruct>? attendanceList;
  final DocumentReference? matchRef;
  final DocumentReference? playerUserRef;
  final bool userIsAdmin;
  final bool matchIsInTheFuture;
  final bool isSelf;
  final String? photoURL;

  @override
  State<ComponentPlayerMatchOverviewRowWidget> createState() =>
      _ComponentPlayerMatchOverviewRowWidgetState();
}

class _ComponentPlayerMatchOverviewRowWidgetState
    extends State<ComponentPlayerMatchOverviewRowWidget> {
  late ComponentPlayerMatchOverviewRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentPlayerMatchOverviewRowModel());

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
                  child: ComponentAttendancePickerWidget(
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
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            !widget.isSelf
                ? FlutterFlowTheme.of(context).secondaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: widget.photoURL!,
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.playerAttendanceInMatch?.player.name,
                          'Player',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
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
                        size: 26.0,
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
                        size: 26.0,
                      ),
                    ),
                  if (functions.memberAttendanceForMatch(
                          widget.playerAttendanceInMatch) ==
                      AttendanceStatus.noReply)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.question_mark,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 26.0,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
