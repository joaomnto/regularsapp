import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component_add_member_model.dart';
export 'component_add_member_model.dart';

class ComponentAddMemberWidget extends StatefulWidget {
  const ComponentAddMemberWidget({
    super.key,
    required this.user,
    required this.group,
  });

  final UsersRecord? user;
  final GroupsRecord? group;

  @override
  State<ComponentAddMemberWidget> createState() =>
      _ComponentAddMemberWidgetState();
}

class _ComponentAddMemberWidgetState extends State<ComponentAddMemberWidget>
    with TickerProviderStateMixin {
  late ComponentAddMemberModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentAddMemberModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: 400.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).alternate,
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
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
                  imageUrl: widget.user!.photoUrl,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
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
                          widget.user?.displayName,
                          'User',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.lexendDeca(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.add_circle,
                    color: FlutterFlowTheme.of(context).success,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    var _shouldSetState = false;
                    if (!widget.group!.membersUserIds
                        .contains(widget.user?.reference)) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Add user'),
                                content: Text(
                                    'Add ${widget.user?.displayName} to group?'),
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
                          id: widget.user!.reference.id,
                        );
                        await membersRecordReference.set({
                          ...createMembersRecordData(
                            isAdmin: false,
                            isPlayer: true,
                            name: widget.user?.displayName,
                            photoUrl: widget.user?.photoUrl,
                            memberStatus: MemberStatus.Invited,
                            userRef: widget.user?.reference,
                            groupRef: widget.group?.reference,
                            addedBy: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'invitedIn': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.createdMember =
                            MembersRecord.getDocumentFromData({
                          ...createMembersRecordData(
                            isAdmin: false,
                            isPlayer: true,
                            name: widget.user?.displayName,
                            photoUrl: widget.user?.photoUrl,
                            memberStatus: MemberStatus.Invited,
                            userRef: widget.user?.reference,
                            groupRef: widget.group?.reference,
                            addedBy: currentUserReference,
                          ),
                          ...mapToFirestore(
                            {
                              'invitedIn': DateTime.now(),
                            },
                          ),
                        }, membersRecordReference);
                        _shouldSetState = true;

                        await widget.group!.reference.update({
                          ...mapToFirestore(
                            {
                              'members': FieldValue.arrayUnion(
                                  [_model.createdMember?.reference]),
                              'membersUserIds': FieldValue.arrayUnion(
                                  [widget.user?.reference]),
                            },
                          ),
                        });
                        _model.futureMatchesInGroup =
                            await queryMatchesRecordOnce(
                          parent: widget.group?.reference,
                          queryBuilder: (matchesRecord) => matchesRecord.where(
                            'matchEndDate',
                            isGreaterThanOrEqualTo: getCurrentTimestamp,
                          ),
                        );
                        _shouldSetState = true;
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
                                          name: widget.user?.displayName,
                                          photoUrl: widget.user?.photoUrl,
                                          memberRefId:
                                              _model.createdMember?.reference,
                                          userRefId: widget.user?.reference,
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
                                    [widget.user?.reference]),
                              },
                            ),
                          });
                        }
                        context.safePop();
                      }
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('User already added'),
                            content: Text(
                                '${widget.user?.displayName} is already in the group'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
