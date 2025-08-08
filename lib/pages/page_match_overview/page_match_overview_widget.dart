import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/component_match_detail/component_match_detail_widget.dart';
import '/components/component_match_status_picker/component_match_status_picker_widget.dart';
import '/components/component_player_match_overview_row/component_player_match_overview_row_widget.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_match_overview_model.dart';
export 'page_match_overview_model.dart';

class PageMatchOverviewWidget extends StatefulWidget {
  const PageMatchOverviewWidget({
    super.key,
    this.group,
    this.userIsAdmin,
    this.groupRef,
    this.matchRef,
    required this.match,
  });

  final GroupsRecord? group;
  final bool? userIsAdmin;
  final DocumentReference? groupRef;
  final DocumentReference? matchRef;
  final MatchesRecord? match;

  static String routeName = 'PageMatchOverview';
  static String routePath = '/pageMatchOverview';

  @override
  State<PageMatchOverviewWidget> createState() =>
      _PageMatchOverviewWidgetState();
}

class _PageMatchOverviewWidgetState extends State<PageMatchOverviewWidget> {
  late PageMatchOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageMatchOverviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MatchesRecord>(
      stream: MatchesRecord.getDocument(widget.matchRef!),
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

        final pageMatchOverviewMatchesRecord = snapshot.data!;

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
                  Icons.close_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [
                Visibility(
                  visible: widget.userIsAdmin ?? true,
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.edit_note,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        PageCreateMatchWidget.routeName,
                        queryParameters: {
                          'groupReference': serializeParam(
                            pageMatchOverviewMatchesRecord.groupRef,
                            ParamType.DocumentReference,
                          ),
                          'group': serializeParam(
                            widget.group,
                            ParamType.Document,
                          ),
                          'newMatchGroupMembers': serializeParam(
                            pageMatchOverviewMatchesRecord.matchGroupMembers,
                            ParamType.DocumentReference,
                            isList: true,
                          ),
                          'match': serializeParam(
                            widget.match,
                            ParamType.Document,
                          ),
                          'userIsAdmin': serializeParam(
                            widget.userIsAdmin,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'group': widget.group,
                          'match': widget.match,
                        },
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
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
                  child: StreamBuilder<List<MembersRecord>>(
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
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<MembersRecord> columnMembersRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnMembersRecord =
                          columnMembersRecordList.isNotEmpty
                              ? columnMembersRecordList.first
                              : null;

                      return SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.userIsAdmin!) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ComponentMatchStatusPickerWidget(
                                                          matchRef:
                                                              widget.matchRef!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions
                                                      .matchStatusDisplayStringForStatus(
                                                          pageMatchOverviewMatchesRecord
                                                              .status!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          functions.colorForStatus(
                                                              pageMatchOverviewMatchesRecord
                                                                  .status),
                                                          Color(0xFF32A4F7),
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                if (widget.userIsAdmin ?? true)
                                                  Icon(
                                                    Icons.edit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              functions.smartDateFormat(
                                                  pageMatchOverviewMatchesRecord
                                                      .matchDate),
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 46.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  pageMatchOverviewMatchesRecord
                                                              .status ==
                                                          MatchStatus.Running
                                                      ? functions
                                                          .matchTimeStringForStartDate(
                                                              pageMatchOverviewMatchesRecord
                                                                  .matchDate)!
                                                      : 'Kick-off at ${dateTimeFormat(
                                                          "Hm",
                                                          pageMatchOverviewMatchesRecord
                                                              .matchDate,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 1.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 26.0, 16.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel1,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            pageMatchOverviewMatchesRecord
                                                                .matchDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons.calendar_month,
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel2,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          dateTimeFormat(
                                                            "Hm",
                                                            pageMatchOverviewMatchesRecord
                                                                .matchDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons.access_time,
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel3,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          '${functions.doubleToIntString(pageMatchOverviewMatchesRecord.duration)} min',
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons.timer_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel4,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          functions
                                                              .matchTypeToString(
                                                                  pageMatchOverviewMatchesRecord
                                                                      .type),
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons.sports_soccer,
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel5,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          pageMatchOverviewMatchesRecord
                                                              .venue?.name,
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .wb_sunny_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .componentMatchDetailModel6,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ComponentMatchDetailWidget(
                                                        text: valueOrDefault<
                                                            String>(
                                                          pageMatchOverviewMatchesRecord
                                                              .subs?.name,
                                                          '-',
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .swap_vert_circle_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Players',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Visibility(
                                            visible: functions
                                                .hasUserInAttendanceList(
                                                    widget.match?.attendance
                                                        .toList(),
                                                    currentUserReference),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  wrapWithModel(
                                                model: _model
                                                    .componentPlayerMatchOverviewRowModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ComponentPlayerMatchOverviewRowWidget(
                                                  userIsAdmin:
                                                      columnMembersRecord!
                                                          .isAdmin,
                                                  playerAttendanceInMatch: functions
                                                      .getUserAttendanceFromMatchAttendanceList(
                                                          pageMatchOverviewMatchesRecord
                                                              .attendance
                                                              .toList(),
                                                          columnMembersRecord
                                                              .reference),
                                                  attendanceStatus: functions
                                                      .getUserAttendanceFromMatchAttendanceList(
                                                          pageMatchOverviewMatchesRecord
                                                              .attendance
                                                              .toList(),
                                                          columnMembersRecord
                                                              .reference)
                                                      ?.status,
                                                  attendanceList:
                                                      pageMatchOverviewMatchesRecord
                                                          .attendance,
                                                  matchRef:
                                                      pageMatchOverviewMatchesRecord
                                                          .reference,
                                                  playerUserRef:
                                                      currentUserReference,
                                                  matchIsInTheFuture:
                                                      functions.matchIsFuture(
                                                          pageMatchOverviewMatchesRecord
                                                              .matchEndDate!),
                                                  isSelf: true,
                                                  photoURL: currentUserPhoto,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  pageMatchOverviewMatchesRecord
                                                      .attendance
                                                      .where((e) =>
                                                          e.status ==
                                                          AttendanceStatus
                                                              .attending)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.cancel_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  pageMatchOverviewMatchesRecord
                                                      .attendance
                                                      .where((e) =>
                                                          e.status ==
                                                          AttendanceStatus
                                                              .notAttending)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.question_mark,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  pageMatchOverviewMatchesRecord
                                                      .attendance
                                                      .where((e) =>
                                                          e.status ==
                                                          AttendanceStatus
                                                              .noReply)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ],
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final attendance = functions
                                                  .filterOutAuthUserFromAttendance(
                                                      pageMatchOverviewMatchesRecord
                                                          .attendance
                                                          .toList(),
                                                      currentUserReference)
                                                  ?.toList() ??
                                              [];
                                          if (attendance.isEmpty) {
                                            return ComponentEmptyListViewWidget(
                                              emptyText: 'No players',
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: attendance.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 10.0),
                                            itemBuilder:
                                                (context, attendanceIndex) {
                                              final attendanceItem =
                                                  attendance[attendanceIndex];
                                              return ComponentPlayerMatchOverviewRowWidget(
                                                key: Key(
                                                    'Key6p5_${attendanceIndex}_of_${attendance.length}'),
                                                userIsAdmin:
                                                    columnMembersRecord!
                                                        .isAdmin,
                                                playerAttendanceInMatch:
                                                    pageMatchOverviewMatchesRecord
                                                        .attendance
                                                        .where((e) =>
                                                            e.player
                                                                .memberRefId ==
                                                            attendanceItem
                                                                .player
                                                                .memberRefId)
                                                        .toList()
                                                        .firstOrNull,
                                                attendanceStatus:
                                                    attendanceItem.status,
                                                attendanceList:
                                                    pageMatchOverviewMatchesRecord
                                                        .attendance,
                                                matchRef:
                                                    pageMatchOverviewMatchesRecord
                                                        .reference,
                                                playerUserRef: attendanceItem
                                                    .player.userRefId,
                                                matchIsInTheFuture:
                                                    functions.matchIsFuture(
                                                        pageMatchOverviewMatchesRecord
                                                            .matchEndDate!),
                                                isSelf: false,
                                                photoURL: attendanceItem
                                                    .player.photoUrl,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ]
                                        .divide(SizedBox(height: 16.0))
                                        .around(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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
