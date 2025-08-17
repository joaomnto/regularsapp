import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sheet_create_group_model.dart';
export 'sheet_create_group_model.dart';

class SheetCreateGroupWidget extends StatefulWidget {
  const SheetCreateGroupWidget({super.key});

  @override
  State<SheetCreateGroupWidget> createState() => _SheetCreateGroupWidgetState();
}

class _SheetCreateGroupWidgetState extends State<SheetCreateGroupWidget> {
  late SheetCreateGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SheetCreateGroupModel());

    _model.groupNameFieldTextController ??= TextEditingController();
    _model.groupNameFieldFocusNode ??= FocusNode();

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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Create Group',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.figtree(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
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
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.groupNameFieldTextController,
                            focusNode: _model.groupNameFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintText: 'Group Name',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.figtree(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .groupNameFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          var groupsRecordReference =
                              GroupsRecord.collection.doc();
                          await groupsRecordReference
                              .set(createGroupsRecordData(
                            name: _model.groupNameFieldTextController.text,
                            createdBy: currentUserReference,
                            colour: random_data.randomColor(),
                          ));
                          _model.creaatedGroup =
                              GroupsRecord.getDocumentFromData(
                                  createGroupsRecordData(
                                    name: _model
                                        .groupNameFieldTextController.text,
                                    createdBy: currentUserReference,
                                    colour: random_data.randomColor(),
                                  ),
                                  groupsRecordReference);
                          if (_model.creaatedGroup?.reference != null) {
                            var membersRecordReference =
                                MembersRecord.createDoc(
                              _model.creaatedGroup!.reference,
                              id: currentUserReference!.id,
                            );
                            await membersRecordReference
                                .set(createMembersRecordData(
                              isAdmin: true,
                              isPlayer: true,
                              name: currentUserDisplayName,
                              photoUrl: currentUserPhoto,
                              userRef: currentUserReference,
                              groupRef: _model.creaatedGroup?.reference,
                              groupName: _model.creaatedGroup?.name,
                              memberStatus: MemberStatus.Accepted,
                            ));
                            _model.createdMember =
                                MembersRecord.getDocumentFromData(
                                    createMembersRecordData(
                                      isAdmin: true,
                                      isPlayer: true,
                                      name: currentUserDisplayName,
                                      photoUrl: currentUserPhoto,
                                      userRef: currentUserReference,
                                      groupRef: _model.creaatedGroup?.reference,
                                      groupName: _model.creaatedGroup?.name,
                                      memberStatus: MemberStatus.Accepted,
                                    ),
                                    membersRecordReference);

                            var groupJoinCodesRecordReference =
                                GroupJoinCodesRecord.collection.doc();
                            await groupJoinCodesRecordReference
                                .set(createGroupJoinCodesRecordData(
                              groupReference: _model.creaatedGroup?.reference,
                              joinCodeHash: random_data.randomString(
                                8,
                                8,
                                false,
                                true,
                                true,
                              ),
                              groupName: _model.creaatedGroup?.name,
                              status: JoinCodeStatus.Active,
                              createdDate: getCurrentTimestamp,
                              updatedDate: getCurrentTimestamp,
                              createdBy: currentUserReference,
                            ));
                            _model.createdGroupJoinDoc =
                                GroupJoinCodesRecord.getDocumentFromData(
                                    createGroupJoinCodesRecordData(
                                      groupReference:
                                          _model.creaatedGroup?.reference,
                                      joinCodeHash: random_data.randomString(
                                        8,
                                        8,
                                        false,
                                        true,
                                        true,
                                      ),
                                      groupName: _model.creaatedGroup?.name,
                                      status: JoinCodeStatus.Active,
                                      createdDate: getCurrentTimestamp,
                                      updatedDate: getCurrentTimestamp,
                                      createdBy: currentUserReference,
                                    ),
                                    groupJoinCodesRecordReference);
                            context.safePop();

                            context.pushNamed(
                              PageGroupOverviewWidget.routeName,
                              queryParameters: {
                                'groupRef': serializeParam(
                                  _model.creaatedGroup?.reference,
                                  ParamType.DocumentReference,
                                ),
                                'group': serializeParam(
                                  _model.creaatedGroup,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'group': _model.creaatedGroup,
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Something went wrong'),
                                  content: Text(
                                      'Failed to create group, please try again.'),
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
                          }

                          safeSetState(() {});
                        },
                        text: 'Create Group',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(height: 16.0))
                  .addToStart(SizedBox(height: 16.0)),
            ),
          ),
        ].addToEnd(SizedBox(height: 40.0)),
      ),
    );
  }
}
