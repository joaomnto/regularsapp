import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rows/row_add_member/row_add_member_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sheet_search_player_model.dart';
export 'sheet_search_player_model.dart';

class SheetSearchPlayerWidget extends StatefulWidget {
  const SheetSearchPlayerWidget({
    super.key,
    required this.group,
    required this.groupRef,
  });

  final GroupsRecord? group;
  final DocumentReference? groupRef;

  @override
  State<SheetSearchPlayerWidget> createState() =>
      _SheetSearchPlayerWidgetState();
}

class _SheetSearchPlayerWidgetState extends State<SheetSearchPlayerWidget> {
  late SheetSearchPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SheetSearchPlayerModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Search Player',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).backButtons,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                ),
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onFieldSubmitted: (_) async {
                                  _model.searchQueryText =
                                      _model.textController.text;
                                  safeSetState(() {});
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Search for users',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.figtree(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  prefixIcon: Icon(
                                    Icons.search_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                maxLines: null,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'lowercase_name',
                            isGreaterThanOrEqualTo: _model.searchQueryText != ''
                                ? _model.searchQueryText
                                : null,
                            isNull: (_model.searchQueryText != ''
                                    ? _model.searchQueryText
                                    : null) ==
                                null,
                          ),
                          limit: 10,
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
                          List<UsersRecord> listViewUsersRecordList = snapshot
                              .data!
                              .where((u) => u.uid != currentUserUid)
                              .toList();

                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUsersRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewUsersRecord =
                                  listViewUsersRecordList[listViewIndex];
                              return RowAddMemberWidget(
                                key: Key(
                                    'Keyode_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                user: listViewUsersRecord,
                                group: widget.group!,
                              );
                            },
                          );
                        },
                      ),
                    ].addToEnd(SizedBox(height: 40.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
