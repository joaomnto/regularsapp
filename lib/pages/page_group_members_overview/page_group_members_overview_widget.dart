import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/components/pickers/picker_add_player/picker_add_player_widget.dart';
import '/components/rows/row_player/row_player_widget.dart';
import '/components/sheets/sheet_player/sheet_player_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_group_members_overview_model.dart';
export 'page_group_members_overview_model.dart';

class PageGroupMembersOverviewWidget extends StatefulWidget {
  const PageGroupMembersOverviewWidget({
    super.key,
    required this.group,
    bool? userIsAdmin,
  }) : this.userIsAdmin = userIsAdmin ?? false;

  final GroupsRecord? group;
  final bool userIsAdmin;

  static String routeName = 'PageGroupMembersOverview';
  static String routePath = '/pageGroupMembersOverview';

  @override
  State<PageGroupMembersOverviewWidget> createState() =>
      _PageGroupMembersOverviewWidgetState();
}

class _PageGroupMembersOverviewWidgetState
    extends State<PageGroupMembersOverviewWidget> {
  late PageGroupMembersOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageGroupMembersOverviewModel());

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
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<MembersRecord> pageGroupMembersOverviewMembersRecordList =
            snapshot.data!;

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
                'Group Members',
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
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20.0,
                    0,
                    140.0,
                  ),
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                '${pageGroupMembersOverviewMembersRecordList.length.toString()} members',
                                '0 members in the group',
                              ),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final membersList =
                                pageGroupMembersOverviewMembersRecordList
                                    .toList();
                            if (membersList.isEmpty) {
                              return ComponentEmptyListViewWidget(
                                emptyText: 'No members yet',
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: membersList.length,
                              itemBuilder: (context, membersListIndex) {
                                final membersListItem =
                                    membersList[membersListIndex];
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
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SheetPlayerWidget(
                                              member: membersListItem,
                                              group: widget.group!,
                                              userIsAdmin: widget.userIsAdmin,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: RowPlayerWidget(
                                    key: Key(
                                        'Keycrf_${membersListIndex}_of_${membersList.length}'),
                                    player: membersListItem,
                                    isLastRow: membersListIndex !=
                                        pageGroupMembersOverviewMembersRecordList
                                            .length,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        if (functions.userIsAdminInGroup(currentUserReference,
                            pageGroupMembersOverviewMembersRecordList.toList()))
                          Opacity(
                            opacity: widget.userIsAdmin ? 1.0 : 0.5,
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
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: PickerAddPlayerWidget(
                                          group: widget.group!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
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
                                iconColor: FlutterFlowTheme.of(context).navText,
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
                                    ),
                                elevation: 10.0,
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
        );
      },
    );
  }
}
