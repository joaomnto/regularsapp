import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/component_attendance_picker/component_attendance_picker_widget.dart';
import '/components/component_group_add_player_picker/component_group_add_player_picker_widget.dart';
import '/components/component_match_row/component_match_row_widget.dart';
import '/components/component_player_row/component_player_row_widget.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_group_overview_model.dart';
export 'page_group_overview_model.dart';

class PageGroupOverviewWidget extends StatefulWidget {
  const PageGroupOverviewWidget({
    super.key,
    required this.group,
  });

  final GroupsRecord? group;

  static String routeName = 'PageGroupOverview';
  static String routePath = '/pageGroupOverview';

  @override
  State<PageGroupOverviewWidget> createState() =>
      _PageGroupOverviewWidgetState();
}

class _PageGroupOverviewWidgetState extends State<PageGroupOverviewWidget>
    with TickerProviderStateMixin {
  late PageGroupOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageGroupOverviewModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MembersRecord>>(
      stream: queryMembersRecord(
        parent: widget.group?.reference,
        queryBuilder: (membersRecord) => membersRecord.orderBy('name'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MembersRecord> pageGroupOverviewMembersRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.group?.name,
                  'Group',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              actions: [
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      PageGroupSettingsWidget.routeName,
                      queryParameters: {
                        'group': serializeParam(
                          widget.group,
                          ParamType.Document,
                        ),
                        'userIsAdmin': serializeParam(
                          functions.userIsAdminInGroup(currentUserReference,
                              pageGroupOverviewMembersRecordList.toList()),
                          ParamType.bool,
                        ),
                        'membership': serializeParam(
                          pageGroupOverviewMembersRecordList
                              .where((e) => e.userRef == currentUserReference)
                              .toList()
                              .firstOrNull,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'group': widget.group,
                        'membership': pageGroupOverviewMembersRecordList
                            .where((e) => e.userRef == currentUserReference)
                            .toList()
                            .firstOrNull,
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                  text: '',
                  icon: Icon(
                    Icons.settings_sharp,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    color: Color(0x004B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: 'Matches',
                            ),
                            Tab(
                              text: 'Members',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: ListView(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  'Upcoming Matches',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<MatchesRecord>>(
                                                stream: queryMatchesRecord(
                                                  parent:
                                                      widget.group?.reference,
                                                  queryBuilder:
                                                      (matchesRecord) =>
                                                          matchesRecord
                                                              .where(
                                                                'matchEndDate',
                                                                isGreaterThanOrEqualTo:
                                                                    functions.dateTimePlusMinutes(
                                                                        -15.0,
                                                                        getCurrentTimestamp),
                                                              )
                                                              .orderBy(
                                                                  'matchEndDate')
                                                              .orderBy(
                                                                  'matchDate',
                                                                  descending:
                                                                      true),
                                                  limit: 20,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<MatchesRecord>
                                                      listViewMatchesRecordList =
                                                      snapshot.data!;
                                                  if (listViewMatchesRecordList
                                                      .isEmpty) {
                                                    return ComponentEmptyListViewWidget(
                                                      emptyText: 'No matches',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewMatchesRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 10.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewMatchesRecord =
                                                          listViewMatchesRecordList[
                                                              listViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            PageMatchOverviewWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'match':
                                                                  serializeParam(
                                                                listViewMatchesRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'group':
                                                                  serializeParam(
                                                                widget.group,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'userIsAdmin':
                                                                  serializeParam(
                                                                functions.userIsAdminInGroup(
                                                                    currentUserReference,
                                                                    pageGroupOverviewMembersRecordList
                                                                        .toList()),
                                                                ParamType.bool,
                                                              ),
                                                              'groupRef':
                                                                  serializeParam(
                                                                widget.group
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'matchRef':
                                                                  serializeParam(
                                                                listViewMatchesRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'match':
                                                                  listViewMatchesRecord,
                                                              'group':
                                                                  widget.group,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .bottomToTop,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        onLongPress: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      ComponentAttendancePickerWidget(
                                                                    playerMatchAttendance: functions.getUserAttendanceFromMatchAttendanceList(
                                                                        listViewMatchesRecord
                                                                            .attendance
                                                                            .toList(),
                                                                        listViewMatchesRecord
                                                                            .attendance
                                                                            .where((e) =>
                                                                                e.player.userRefId ==
                                                                                currentUserReference)
                                                                            .toList()
                                                                            .firstOrNull
                                                                            ?.player
                                                                            .memberRefId)!,
                                                                    matchRef:
                                                                        listViewMatchesRecord
                                                                            .reference,
                                                                    matchAttendanceList:
                                                                        listViewMatchesRecord
                                                                            .attendance,
                                                                    isSelf:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child:
                                                            ComponentMatchRowWidget(
                                                          key: Key(
                                                              'Key2jg_${listViewIndex}_of_${listViewMatchesRecordList.length}'),
                                                          matchStatus:
                                                              listViewMatchesRecord
                                                                  .status,
                                                          matchDate:
                                                              listViewMatchesRecord
                                                                  .matchDate,
                                                          kickofftime:
                                                              listViewMatchesRecord
                                                                  .matchDate,
                                                          match:
                                                              listViewMatchesRecord,
                                                          showGroup: false,
                                                          playerAttendanceInMatch:
                                                              functions.authUserAttendanceForMatch(
                                                                  listViewMatchesRecord
                                                                      .attendance
                                                                      .toList(),
                                                                  currentUserReference)!,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  'Past Matches',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<MatchesRecord>>(
                                                stream: queryMatchesRecord(
                                                  parent:
                                                      widget.group?.reference,
                                                  queryBuilder:
                                                      (matchesRecord) =>
                                                          matchesRecord
                                                              .where(
                                                                'matchEndDate',
                                                                isLessThan: functions
                                                                    .dateTimePlusMinutes(
                                                                        -15.0,
                                                                        getCurrentTimestamp),
                                                              )
                                                              .orderBy(
                                                                  'matchEndDate',
                                                                  descending:
                                                                      true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<MatchesRecord>
                                                      listViewMatchesRecordList =
                                                      snapshot.data!;
                                                  if (listViewMatchesRecordList
                                                      .isEmpty) {
                                                    return ComponentEmptyListViewWidget(
                                                      emptyText: 'No matches',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewMatchesRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 10.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewMatchesRecord =
                                                          listViewMatchesRecordList[
                                                              listViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            PageMatchOverviewWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'match':
                                                                  serializeParam(
                                                                listViewMatchesRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'group':
                                                                  serializeParam(
                                                                widget.group,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'userIsAdmin':
                                                                  serializeParam(
                                                                functions.userIsAdminInGroup(
                                                                    currentUserReference,
                                                                    pageGroupOverviewMembersRecordList
                                                                        .toList()),
                                                                ParamType.bool,
                                                              ),
                                                              'groupRef':
                                                                  serializeParam(
                                                                widget.group
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'matchRef':
                                                                  serializeParam(
                                                                listViewMatchesRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'match':
                                                                  listViewMatchesRecord,
                                                              'group':
                                                                  widget.group,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .bottomToTop,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child:
                                                            ComponentMatchRowWidget(
                                                          key: Key(
                                                              'Keyccd_${listViewIndex}_of_${listViewMatchesRecordList.length}'),
                                                          matchStatus:
                                                              listViewMatchesRecord
                                                                  .status,
                                                          matchDate:
                                                              listViewMatchesRecord
                                                                  .matchDate,
                                                          kickofftime:
                                                              listViewMatchesRecord
                                                                  .matchDate,
                                                          match:
                                                              listViewMatchesRecord,
                                                          showGroup: false,
                                                          playerAttendanceInMatch:
                                                              functions.authUserAttendanceForMatch(
                                                                  listViewMatchesRecord
                                                                      .attendance
                                                                      .toList(),
                                                                  currentUserReference)!,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (functions.userIsAdminInGroup(
                                            currentUserReference,
                                            pageGroupOverviewMembersRecordList
                                                .toList())) {
                                          context.pushNamed(
                                            PageCreateMatchWidget.routeName,
                                            queryParameters: {
                                              'groupReference': serializeParam(
                                                widget.group?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'group': serializeParam(
                                                widget.group,
                                                ParamType.Document,
                                              ),
                                              'newMatchGroupMembers':
                                                  serializeParam(
                                                pageGroupOverviewMembersRecordList
                                                    .map((e) => e.reference)
                                                    .toList(),
                                                ParamType.DocumentReference,
                                                isList: true,
                                              ),
                                              'userIsAdmin': serializeParam(
                                                functions.userIsAdminInGroup(
                                                    currentUserReference,
                                                    pageGroupOverviewMembersRecordList
                                                        .toList()),
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'group': widget.group,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                              ),
                                            },
                                          );
                                        } else {
                                          unawaited(
                                            () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Create Match'),
                                                    content: Text(
                                                        'Only admins can create matches'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }(),
                                          );
                                        }
                                      },
                                      text: 'Create Match',
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                              color: functions.userIsAdminInGroup(
                                                      currentUserReference,
                                                      pageGroupOverviewMembersRecordList
                                                          .toList())
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : Color(0x9B14181B),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: ListView(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final membersList =
                                          pageGroupOverviewMembersRecordList
                                              .toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children:
                                            List.generate(membersList.length,
                                                    (membersListIndex) {
                                          final membersListItem =
                                              membersList[membersListIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                PageMemberProfileWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'member': serializeParam(
                                                    membersListItem,
                                                    ParamType.Document,
                                                  ),
                                                  'userIsAdmin': serializeParam(
                                                    functions.userIsAdminInGroup(
                                                        currentUserReference,
                                                        pageGroupOverviewMembersRecordList
                                                            .toList()),
                                                    ParamType.bool,
                                                  ),
                                                  'group': serializeParam(
                                                    widget.group,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'member': membersListItem,
                                                  'group': widget.group,
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                  ),
                                                },
                                              );
                                            },
                                            child: ComponentPlayerRowWidget(
                                              key: Key(
                                                  'Keyx4r_${membersListIndex}_of_${membersList.length}'),
                                              player: membersListItem,
                                            ),
                                          );
                                        })
                                                .divide(SizedBox(height: 10.0))
                                                .around(SizedBox(height: 10.0)),
                                      );
                                    },
                                  ),
                                  if (functions.userIsAdminInGroup(
                                      currentUserReference,
                                      pageGroupOverviewMembersRecordList
                                          .toList()))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ComponentGroupAddPlayerPickerWidget(
                                                    group: widget.group!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'Add Player',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.lexendDeca(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                          elevation: 1.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
