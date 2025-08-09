import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/component_match_detail/component_match_detail_widget.dart';
import '/components/component_match_status_picker/component_match_status_picker_widget.dart';
import '/components/component_player_match_overview_row/component_player_match_overview_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'match_sheet_model.dart';
export 'match_sheet_model.dart';

class MatchSheetWidget extends StatefulWidget {
  const MatchSheetWidget({
    super.key,
    required this.grouRef,
    required this.matchRef,
    this.group,
    bool? userIsAdmin,
  }) : this.userIsAdmin = userIsAdmin ?? false;

  final DocumentReference? grouRef;
  final DocumentReference? matchRef;
  final GroupsRecord? group;
  final bool userIsAdmin;

  @override
  State<MatchSheetWidget> createState() => _MatchSheetWidgetState();
}

class _MatchSheetWidgetState extends State<MatchSheetWidget> {
  late MatchSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchSheetModel());

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
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: StreamBuilder<MatchesRecord>(
        stream: MatchesRecord.getDocument(widget.matchRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }

          final columnMatchesRecord = snapshot.data!;

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
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
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Visibility(
                    visible: widget.userIsAdmin,
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
                              columnMatchesRecord.groupRef,
                              ParamType.DocumentReference,
                            ),
                            'group': serializeParam(
                              widget.group,
                              ParamType.Document,
                            ),
                            'newMatchGroupMembers': serializeParam(
                              columnMatchesRecord.matchGroupMembers,
                              ParamType.DocumentReference,
                              isList: true,
                            ),
                            'match': serializeParam(
                              columnMatchesRecord,
                              ParamType.Document,
                            ),
                            'userIsAdmin': serializeParam(
                              widget.userIsAdmin,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'group': widget.group,
                            'match': columnMatchesRecord,
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: StreamBuilder<List<MembersRecord>>(
                    stream: queryMembersRecord(
                      parent: widget.grouRef,
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
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
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

                      return Column(
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
                                            if (widget.userIsAdmin) {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        ComponentMatchStatusPickerWidget(
                                                      matchRef:
                                                          widget.matchRef!,
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    functions
                                                        .matchStatusDisplayStringForStatus(
                                                            columnMatchesRecord
                                                                .status!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .lexendDeca(
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
                                                                columnMatchesRecord
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
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.smartDateFormat(
                                                columnMatchesRecord.matchDate),
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.lexendDeca(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 46.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                columnMatchesRecord.status ==
                                                        MatchStatus.Running
                                                    ? functions
                                                        .matchTimeStringForStartDate(
                                                            columnMatchesRecord
                                                                .matchDate)!
                                                    : 'Kick-off at ${dateTimeFormat(
                                                        "Hm",
                                                        columnMatchesRecord
                                                            .matchDate,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .lexendDeca(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
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
                                Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 10.0, 16.0, 10.0),
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
                                                              columnMatchesRecord
                                                                  .matchDate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '-',
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                          ),
                                                          editMode: false,
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
                                                              columnMatchesRecord
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
                                                          editMode: false,
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
                                                            '${functions.doubleToIntString(columnMatchesRecord.duration)} min',
                                                            '-',
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .timer_outlined,
                                                          ),
                                                          editMode: false,
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
                                                                    columnMatchesRecord
                                                                        .type),
                                                            '-',
                                                          ),
                                                          icon: Icon(
                                                            Icons.sports_soccer,
                                                          ),
                                                          editMode: false,
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
                                                            columnMatchesRecord
                                                                .venue?.name,
                                                            '-',
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .wb_sunny_outlined,
                                                          ),
                                                          editMode: false,
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
                                                            columnMatchesRecord
                                                                .subs?.name,
                                                            '-',
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .swap_vert_circle_outlined,
                                                          ),
                                                          editMode: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
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
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Container(
                                                      height: 26.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnMatchesRecord
                                                                          .attendance
                                                                          .where((e) =>
                                                                              e.status ==
                                                                              AttendanceStatus.attending)
                                                                          .toList()
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lexendDeca(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .cancel_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnMatchesRecord
                                                                          .attendance
                                                                          .where((e) =>
                                                                              e.status ==
                                                                              AttendanceStatus.notAttending)
                                                                          .toList()
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lexendDeca(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        16.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        16.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Container(
                                                      height: 26.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnMatchesRecord
                                                                          .attendance
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.lexendDeca(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ]
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            4.0))
                                                                    .around(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .around(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Visibility(
                                                    visible: functions
                                                        .hasUserInAttendanceList(
                                                            columnMatchesRecord
                                                                .attendance
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
                                                          playerAttendanceInMatch:
                                                              functions.getUserAttendanceFromMatchAttendanceListWithRefId(
                                                                  columnMatchesRecord
                                                                      .attendance
                                                                      .toList(),
                                                                  currentUserReference),
                                                          attendanceStatus: functions
                                                              .getUserAttendanceFromMatchAttendanceListWithRefId(
                                                                  columnMatchesRecord
                                                                      .attendance
                                                                      .toList(),
                                                                  currentUserReference)
                                                              ?.status,
                                                          attendanceList:
                                                              columnMatchesRecord
                                                                  .attendance,
                                                          matchRef:
                                                              widget.matchRef!,
                                                          playerUserRef:
                                                              currentUserReference,
                                                          matchIsInTheFuture:
                                                              functions.matchIsFuture(
                                                                  columnMatchesRecord
                                                                      .matchDate!),
                                                          isSelf: true,
                                                          photoURL:
                                                              currentUserPhoto,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final attendance = functions
                                                        .filterOutAuthUserFromAttendance(
                                                            columnMatchesRecord
                                                                .attendance
                                                                .toList(),
                                                            currentUserReference)
                                                        ?.toList() ??
                                                    [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: attendance.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 10.0),
                                                  itemBuilder: (context,
                                                      attendanceIndex) {
                                                    final attendanceItem =
                                                        attendance[
                                                            attendanceIndex];
                                                    return ComponentPlayerMatchOverviewRowWidget(
                                                      key: Key(
                                                          'Keywg3_${attendanceIndex}_of_${attendance.length}'),
                                                      userIsAdmin:
                                                          widget.userIsAdmin,
                                                      matchIsInTheFuture:
                                                          functions.matchIsFuture(
                                                              columnMatchesRecord
                                                                  .matchDate!),
                                                      isSelf: false,
                                                      photoURL: attendanceItem
                                                          .player.photoUrl,
                                                      playerAttendanceInMatch:
                                                          attendanceItem,
                                                      attendanceStatus:
                                                          attendanceItem.status,
                                                      attendanceList:
                                                          columnMatchesRecord
                                                              .attendance,
                                                      matchRef:
                                                          widget.matchRef!,
                                                      playerUserRef:
                                                          attendanceItem
                                                              .player.userRefId,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 20.0))
                                            .addToStart(SizedBox(height: 20.0))
                                            .addToEnd(SizedBox(height: 60.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
