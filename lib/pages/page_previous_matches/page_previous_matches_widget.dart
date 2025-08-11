import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/components/loaders/loader_match_row/loader_match_row_widget.dart';
import '/components/rows/row_match/row_match_widget.dart';
import '/components/sheets/sheet_match/sheet_match_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'page_previous_matches_model.dart';
export 'page_previous_matches_model.dart';

class PagePreviousMatchesWidget extends StatefulWidget {
  const PagePreviousMatchesWidget({
    super.key,
    required this.group,
    bool? userIsAdmin,
  }) : this.userIsAdmin = userIsAdmin ?? false;

  final GroupsRecord? group;
  final bool userIsAdmin;

  static String routeName = 'PagePreviousMatches';
  static String routePath = '/pagePreviousMatches';

  @override
  State<PagePreviousMatchesWidget> createState() =>
      _PagePreviousMatchesWidgetState();
}

class _PagePreviousMatchesWidgetState extends State<PagePreviousMatchesWidget> {
  late PagePreviousMatchesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagePreviousMatchesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              context.pop();
            },
          ),
          title: Text(
            'Finished Matches',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.lexendDeca(
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).navText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      MatchesRecord>.separated(
                    pagingController: _model.setListViewController(
                        MatchesRecord.collection(widget.group?.reference)
                            .where(
                              'matchEndDate',
                              isLessThan: functions.dateTimePlusMinutes(
                                  -15.0, getCurrentTimestamp),
                            )
                            .orderBy('matchEndDate', descending: true),
                        parent: widget.group?.reference),
                    padding: EdgeInsets.fromLTRB(
                      0,
                      30.0,
                      0,
                      40.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                    builderDelegate: PagedChildBuilderDelegate<MatchesRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) =>
                          LoaderMatchRowWidget(),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) =>
                          LoaderMatchRowWidget(),
                      noItemsFoundIndicatorBuilder: (_) =>
                          ComponentEmptyListViewWidget(
                        emptyText: 'No matches',
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewMatchesRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
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
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.94,
                                      child: SheetMatchWidget(
                                        grouRef:
                                            listViewMatchesRecord.groupRef!,
                                        matchRef:
                                            listViewMatchesRecord.reference,
                                        group: widget.group,
                                        userIsAdmin: widget.userIsAdmin,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: RowMatchWidget(
                            key: Key(
                                'Key1dp_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                            matchStatus: listViewMatchesRecord.status,
                            matchDate: listViewMatchesRecord.matchDate,
                            kickofftime: listViewMatchesRecord.matchDate,
                            match: listViewMatchesRecord,
                            showGroup: false,
                            playerAttendanceInMatch:
                                functions.authUserAttendanceForMatch(
                                    listViewMatchesRecord.attendance.toList(),
                                    currentUserReference)!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
