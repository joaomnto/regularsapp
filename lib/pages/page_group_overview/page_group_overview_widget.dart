import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/components/loaders/loader_match_row/loader_match_row_widget.dart';
import '/components/pickers/picker_attendance/picker_attendance_widget.dart';
import '/components/rows/row_match/row_match_widget.dart';
import '/components/rows/row_request_to_join/row_request_to_join_widget.dart';
import '/components/sheets/sheet_create_edit_match/sheet_create_edit_match_widget.dart';
import '/components/sheets/sheet_match/sheet_match_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_group_overview_model.dart';
export 'page_group_overview_model.dart';

class PageGroupOverviewWidget extends StatefulWidget {
  const PageGroupOverviewWidget({
    super.key,
    this.membership,
    required this.groupRef,
    required this.group,
  });

  final MembersRecord? membership;
  final DocumentReference? groupRef;
  final GroupsRecord? group;

  static String routeName = 'PageGroupOverview';
  static String routePath = '/pageGroupOverview';

  @override
  State<PageGroupOverviewWidget> createState() =>
      _PageGroupOverviewWidgetState();
}

class _PageGroupOverviewWidgetState extends State<PageGroupOverviewWidget> {
  late PageGroupOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageGroupOverviewModel());

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
        parent: widget.groupRef,
        queryBuilder: (membersRecord) => membersRecord.where(
          'userRef',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
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
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<MembersRecord> pageGroupOverviewMembersRecordList = snapshot.data!;
        final pageGroupOverviewMembersRecord =
            pageGroupOverviewMembersRecordList.isNotEmpty
                ? pageGroupOverviewMembersRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).backButtons,
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
                      color: FlutterFlowTheme.of(context).backButtons,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.groups_2,
                      color: FlutterFlowTheme.of(context).backButtons,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        PageGroupMembersOverviewWidget.routeName,
                        queryParameters: {
                          'group': serializeParam(
                            widget.group,
                            ParamType.Document,
                          ),
                          'userIsAdmin': serializeParam(
                            pageGroupOverviewMembersRecord?.isAdmin,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'group': widget.group,
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.keyboard_control,
                      color: FlutterFlowTheme.of(context).backButtons,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        PageGroupSettingsWidget.routeName,
                        queryParameters: {
                          'group': serializeParam(
                            widget.group,
                            ParamType.Document,
                          ),
                          'userIsAdmin': serializeParam(
                            pageGroupOverviewMembersRecord?.isAdmin,
                            ParamType.bool,
                          ),
                          'membership': serializeParam(
                            pageGroupOverviewMembersRecord,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'group': widget.group,
                          'membership': pageGroupOverviewMembersRecord,
                        },
                      );
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        140.0,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        if (pageGroupOverviewMembersRecord?.isAdmin ?? true)
                          Container(
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<JoinRequestsRecord>>(
                              stream: queryJoinRequestsRecord(
                                queryBuilder: (joinRequestsRecord) =>
                                    joinRequestsRecord
                                        .where(
                                          'status',
                                          isEqualTo: JoinRequestStatus.Pending
                                              .serialize(),
                                        )
                                        .where(
                                          'groupReference',
                                          isEqualTo: widget.groupRef,
                                        ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<JoinRequestsRecord>
                                    containerJoinRequestsRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: containerJoinRequestsRecordList
                                        .isNotEmpty,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 10.0),
                                          child: Text(
                                            'Pending requests',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.figtree(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final joinRequests =
                                                  containerJoinRequestsRecordList
                                                      .toList();
                                              if (joinRequests.isEmpty) {
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child:
                                                      ComponentEmptyListViewWidget(
                                                    emptyText:
                                                        'No new requests',
                                                  ),
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: joinRequests.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    joinRequestsIndex) {
                                                  final joinRequestsItem =
                                                      joinRequests[
                                                          joinRequestsIndex];
                                                  return RowRequestToJoinWidget(
                                                    key: Key(
                                                        'Key6lq_${joinRequestsIndex}_of_${joinRequests.length}'),
                                                    joinRequestDocument:
                                                        joinRequestsItem,
                                                    group: widget.group!,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 10.0),
                              child: Text(
                                'Upcoming matches',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.figtree(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: StreamBuilder<List<MatchesRecord>>(
                                stream: queryMatchesRecord(
                                  parent: widget.groupRef,
                                  queryBuilder: (matchesRecord) => matchesRecord
                                      .where(
                                        'matchEndDate',
                                        isGreaterThanOrEqualTo:
                                            functions.dateTimePlusMinutes(
                                                -15.0, getCurrentTimestamp),
                                      )
                                      .orderBy('matchEndDate')
                                      .orderBy('matchDate', descending: true),
                                  limit: 20,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return LoaderMatchRowWidget();
                                  }
                                  List<MatchesRecord>
                                      listViewMatchesRecordList =
                                      snapshot.data!;
                                  if (listViewMatchesRecordList.isEmpty) {
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: ComponentEmptyListViewWidget(
                                        emptyText: 'No matches',
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewMatchesRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 10.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewMatchesRecord =
                                          listViewMatchesRecordList[
                                              listViewIndex];
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
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.94,
                                                    child: SheetMatchWidget(
                                                      grouRef:
                                                          widget.groupRef!,
                                                      matchRef:
                                                          listViewMatchesRecord
                                                              .reference,
                                                      group: widget.group,
                                                      userIsAdmin:
                                                          pageGroupOverviewMembersRecord!
                                                              .isAdmin,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        onLongPress: () async {
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
                                                  child: PickerAttendanceWidget(
                                                    playerMatchAttendance: functions
                                                        .getUserAttendanceFromMatchAttendanceListWithRefId(
                                                            listViewMatchesRecord
                                                                .attendance
                                                                .toList(),
                                                            currentUserReference)!,
                                                    matchRef:
                                                        listViewMatchesRecord
                                                            .reference,
                                                    matchAttendanceList:
                                                        listViewMatchesRecord
                                                            .attendance,
                                                    isSelf: true,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: RowMatchWidget(
                                          key: Key(
                                              'Key1ck_${listViewIndex}_of_${listViewMatchesRecordList.length}'),
                                          matchStatus:
                                              listViewMatchesRecord.status,
                                          matchDate:
                                              listViewMatchesRecord.matchDate,
                                          kickofftime:
                                              listViewMatchesRecord.matchDate,
                                          match: listViewMatchesRecord,
                                          showGroup: false,
                                          playerAttendanceInMatch: functions
                                              .authUserAttendanceForMatch(
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    PagePreviousMatchesWidget.routeName,
                                    queryParameters: {
                                      'group': serializeParam(
                                        widget.group,
                                        ParamType.Document,
                                      ),
                                      'userIsAdmin': serializeParam(
                                        pageGroupOverviewMembersRecord?.isAdmin,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'group': widget.group,
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Finished matches',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.figtree(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 50.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Opacity(
                              opacity: pageGroupOverviewMembersRecord!.isAdmin
                                  ? 1.0
                                  : 0.5,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (pageGroupOverviewMembersRecord.isAdmin) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.94,
                                              child: SheetCreateEditMatchWidget(
                                                grouRef: widget.groupRef!,
                                                userIsAdmin: true,
                                                group: widget.group,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
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
                                text: '',
                                icon: Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                                    shadows: [
                                      Shadow(
                                        color: Color(0x19000000),
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 10.0,
                                      )
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
