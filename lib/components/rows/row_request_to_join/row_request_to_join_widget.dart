import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_request_to_join_model.dart';
export 'row_request_to_join_model.dart';

class RowRequestToJoinWidget extends StatefulWidget {
  const RowRequestToJoinWidget({
    super.key,
    required this.joinRequestDocument,
    required this.group,
  });

  final JoinRequestsRecord? joinRequestDocument;
  final GroupsRecord? group;

  @override
  State<RowRequestToJoinWidget> createState() => _RowRequestToJoinWidgetState();
}

class _RowRequestToJoinWidgetState extends State<RowRequestToJoinWidget> {
  late RowRequestToJoinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowRequestToJoinModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTimeFormat(
                    "relative",
                    widget.joinRequestDocument!.createdAt!,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.figtree(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).textMatchingPrimary,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                ),
                Text(
                  '${widget.joinRequestDocument?.requesterName} requested to join ${widget.group?.name}',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.figtree(
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Accept request'),
                                content: Text(
                                    'Add ${widget.joinRequestDocument?.requesterName} to group?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        var membersRecordReference = MembersRecord.createDoc(
                          widget.group!.reference,
                          id: widget
                              .joinRequestDocument!.requesterReference!.id,
                        );
                        await membersRecordReference
                            .set(createMembersRecordData(
                          isAdmin: false,
                          isPlayer: true,
                          name: widget.joinRequestDocument?.requesterName,
                          photoUrl: widget.joinRequestDocument?.requesterPhoto,
                          memberStatus: MemberStatus.Accepted,
                          invitedIn: getCurrentTimestamp,
                          userRef:
                              widget.joinRequestDocument?.requesterReference,
                          groupRef: widget.group?.reference,
                          addedBy: currentUserReference,
                          groupName: widget.group?.name,
                          groupColor: widget.group?.colour,
                        ));
                        _model.createdMember =
                            MembersRecord.getDocumentFromData(
                                createMembersRecordData(
                                  isAdmin: false,
                                  isPlayer: true,
                                  name: widget
                                      .joinRequestDocument?.requesterName,
                                  photoUrl: widget
                                      .joinRequestDocument?.requesterPhoto,
                                  memberStatus: MemberStatus.Accepted,
                                  invitedIn: getCurrentTimestamp,
                                  userRef: widget
                                      .joinRequestDocument?.requesterReference,
                                  groupRef: widget.group?.reference,
                                  addedBy: currentUserReference,
                                  groupName: widget.group?.name,
                                  groupColor: widget.group?.colour,
                                ),
                                membersRecordReference);

                        await widget.group!.reference.update({
                          ...mapToFirestore(
                            {
                              'members': FieldValue.arrayUnion(
                                  [_model.createdMember?.reference]),
                              'membersUserIds': FieldValue.arrayUnion([
                                widget.joinRequestDocument?.requesterReference
                              ]),
                            },
                          ),
                        });
                        _model.futureMatchesInGroup =
                            await queryMatchesRecordOnce(
                          queryBuilder: (matchesRecord) => matchesRecord.where(
                            'matchEndDate',
                            isGreaterThanOrEqualTo: getCurrentTimestamp,
                          ),
                        );
                        for (int loop1Index = 0;
                            loop1Index < _model.futureMatchesInGroup!.length;
                            loop1Index++) {
                          final currentLoop1Item =
                              _model.futureMatchesInGroup![loop1Index];

                          await currentLoop1Item.reference.update({
                            ...mapToFirestore(
                              {
                                'attendance': FieldValue.arrayUnion([
                                  getMatchAttendanceFirestoreData(
                                    updateMatchAttendanceStruct(
                                      MatchAttendanceStruct(
                                        status: AttendanceStatus.noReply,
                                        player: EmbeddedPlayerStruct(
                                          name: _model.createdMember?.name,
                                          photoUrl:
                                              _model.createdMember?.photoUrl,
                                          memberRefId:
                                              _model.createdMember?.reference,
                                          userRefId:
                                              _model.createdMember?.userRef,
                                        ),
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                                'matchGroupMembers': FieldValue.arrayUnion(
                                    [_model.createdMember?.reference]),
                                'attendanceUserRefs': FieldValue.arrayUnion(
                                    [_model.createdMember?.userRef]),
                              },
                            ),
                          });
                        }

                        await widget.joinRequestDocument!.reference
                            .update(createJoinRequestsRecordData(
                          status: JoinRequestStatus.Approved,
                          resolvedAt: getCurrentTimestamp,
                          resolvedBy: currentUserReference,
                        ));
                        context.safePop();
                      }

                      safeSetState(() {});
                    },
                    text: 'Accept',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).success,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Request to join'),
                                content: Text(
                                    'Reject request from ${widget.joinRequestDocument?.requesterName} to join the group?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await widget.joinRequestDocument!.reference
                            .update(createJoinRequestsRecordData(
                          status: JoinRequestStatus.Rejected,
                          resolvedAt: getCurrentTimestamp,
                          resolvedBy: currentUserReference,
                        ));
                        context.safePop();
                      }
                    },
                    text: 'Reject',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.figtree(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ].divide(SizedBox(height: 14.0)).addToStart(SizedBox(height: 14.0)),
      ),
    );
  }
}
