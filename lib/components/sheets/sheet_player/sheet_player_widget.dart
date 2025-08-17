import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sheet_player_model.dart';
export 'sheet_player_model.dart';

class SheetPlayerWidget extends StatefulWidget {
  const SheetPlayerWidget({
    super.key,
    required this.member,
    bool? userIsAdmin,
    required this.group,
  }) : this.userIsAdmin = userIsAdmin ?? false;

  final MembersRecord? member;
  final bool userIsAdmin;
  final GroupsRecord? group;

  @override
  State<SheetPlayerWidget> createState() => _SheetPlayerWidgetState();
}

class _SheetPlayerWidgetState extends State<SheetPlayerWidget>
    with TickerProviderStateMixin {
  late SheetPlayerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SheetPlayerModel());

    _model.textController ??= TextEditingController(text: widget.member?.name);
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'dividerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 4.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close_outlined,
                  color: FlutterFlowTheme.of(context).backButtons,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Player',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).navText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
              actions: [
                Visibility(
                  visible: widget.userIsAdmin &&
                      (widget.member?.userRef == null) &&
                      (_model.editMode == false),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.edit_note,
                      color: FlutterFlowTheme.of(context).backButtons,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      _model.editMode = !_model.editMode;
                      safeSetState(() {});
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.network(
                                  functions.normalizeGoogleAvatar(
                                      widget.member?.photoUrl)!,
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['cardOnPageLoadAnimation']!),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: _model.editMode,
                              readOnly: !_model.editMode,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                hintText: widget.member?.name,
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
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
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.figtree(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                              textAlign: TextAlign.center,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          if (_model.editMode)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await widget.member!.reference
                                      .update(createMembersRecordData(
                                    name: _model.textController.text,
                                  ));
                                  _model.editMode = false;
                                  safeSetState(() {});
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent1,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.lexendDeca(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  elevation: 1.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation']!),
                            ),
                        ].addToStart(SizedBox(height: 16.0)),
                      ),
                      if (widget.userIsAdmin)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Divider(
                              height: 20.0,
                              thickness: 1.0,
                              indent: 24.0,
                              endIndent: 24.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ).animateOnPageLoad(
                                animationsMap['dividerOnPageLoadAnimation']!),
                            if (widget.member?.userRef != null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.admin_panel_settings,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: SwitchListTile.adaptive(
                                              value: _model.adminSwitchValue ??=
                                                  widget.member!.isAdmin,
                                              onChanged: (newValue) async {
                                                safeSetState(() =>
                                                    _model.adminSwitchValue =
                                                        newValue);
                                                if (newValue) {
                                                  await widget
                                                      .member!.reference
                                                      .update(
                                                          createMembersRecordData(
                                                    isAdmin:
                                                        _model.adminSwitchValue,
                                                    isPlayer: false,
                                                  ));

                                                  await widget.group!.reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'adminUserIds':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget
                                                              .member?.userRef
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await widget
                                                      .member!.reference
                                                      .update(
                                                          createMembersRecordData(
                                                    isAdmin:
                                                        _model.adminSwitchValue,
                                                  ));

                                                  await widget.group!.reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'adminUserIds':
                                                            FieldValue
                                                                .arrayRemove([
                                                          widget
                                                              .member?.userRef
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              title: Text(
                                                'Admin',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              activeColor: Color(0xFF00FF2B),
                                              activeTrackColor:
                                                  Color(0x3439D2C0),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 4.0, 0.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.directions_run_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: SwitchListTile.adaptive(
                                            value: _model.playerSwitchValue ??=
                                                widget.member!.isPlayer,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.playerSwitchValue =
                                                      newValue);
                                              if (newValue) {
                                                await widget.member!.reference
                                                    .update(
                                                        createMembersRecordData(
                                                  isPlayer:
                                                      _model.playerSwitchValue,
                                                ));
                                              } else {
                                                await widget.member!.reference
                                                    .update(
                                                        createMembersRecordData(
                                                  isPlayer:
                                                      _model.playerSwitchValue,
                                                ));
                                              }
                                            },
                                            title: Text(
                                              'Player',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.figtree(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor: Color(0xFF00FF2B),
                                            activeTrackColor: Color(0x3439D2C0),
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 4.0, 0.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (widget.userIsAdmin)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 16.0, 20.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Remove Member'),
                                                  content: Text(
                                                      'Are you sure you want to remove ${widget.member?.name} from ${widget.group?.name}?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await widget.group!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'members': FieldValue.arrayRemove(
                                                [widget.member?.reference]),
                                            'membersUserIds':
                                                FieldValue.arrayRemove(
                                                    [widget.member?.userRef]),
                                            'adminUserIds':
                                                FieldValue.arrayRemove(
                                                    [widget.member?.userRef]),
                                          },
                                        ),
                                      });
                                      _model.matchesToRemovUser =
                                          await queryMatchesRecordOnce(
                                        parent: widget.group?.reference,
                                        queryBuilder: (matchesRecord) =>
                                            matchesRecord.where(
                                          'matchEndDate',
                                          isGreaterThanOrEqualTo:
                                              getCurrentTimestamp,
                                        ),
                                      );
                                      _shouldSetState = true;
                                      for (int loop1Index = 0;
                                          loop1Index <
                                              _model.matchesToRemovUser!.length;
                                          loop1Index++) {
                                        final currentLoop1Item = _model
                                            .matchesToRemovUser![loop1Index];

                                        await currentLoop1Item.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'matchGroupMembers':
                                                  FieldValue.arrayRemove([
                                                widget.member?.reference
                                              ]),
                                              'attendanceUserRefs':
                                                  FieldValue.arrayRemove([
                                                widget.member?.userRef
                                              ]),
                                              'attendance':
                                                  getMatchAttendanceListFirestoreData(
                                                functions
                                                    .attendanceByRemovingAttendant(
                                                        widget
                                                            .member!.reference,
                                                        currentLoop1Item
                                                            .attendance
                                                            .toList()),
                                              ),
                                            },
                                          ),
                                        });
                                      }
                                      await widget.member!.reference.delete();
                                      context.safePop();
                                    } else {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Remove from group',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.lexendDeca(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                    ].addToEnd(SizedBox(height: 50.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
