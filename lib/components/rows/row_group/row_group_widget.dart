import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_group_model.dart';
export 'row_group_model.dart';

class RowGroupWidget extends StatefulWidget {
  const RowGroupWidget({
    super.key,
    required this.membership,
    bool? isLastRow,
    bool? hasNotifications,
  })  : this.isLastRow = isLastRow ?? false,
        this.hasNotifications = hasNotifications ?? false;

  final MembersRecord? membership;
  final bool isLastRow;
  final bool hasNotifications;

  @override
  State<RowGroupWidget> createState() => _RowGroupWidgetState();
}

class _RowGroupWidgetState extends State<RowGroupWidget> {
  late RowGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowGroupModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(18.0, 20.0, 18.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.membership?.groupName,
                        'Group',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.figtree(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .textMatchingPrimary,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                    if (widget.membership?.isAdmin ?? true)
                      Container(
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<JoinRequestsRecord>>(
                          stream: queryJoinRequestsRecord(
                            queryBuilder: (joinRequestsRecord) =>
                                joinRequestsRecord
                                    .where(
                                      'groupReference',
                                      isEqualTo: widget.membership?.groupRef,
                                    )
                                    .where(
                                      'status',
                                      isEqualTo:
                                          JoinRequestStatus.Pending.serialize(),
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
                            List<JoinRequestsRecord> rowJoinRequestsRecordList =
                                snapshot.data!;
                            final rowJoinRequestsRecord =
                                rowJoinRequestsRecordList.isNotEmpty
                                    ? rowJoinRequestsRecordList.first
                                    : null;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (rowJoinRequestsRecord != null)
                                  Container(
                                    width: 6.0,
                                    height: 6.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Icon(
                  Icons.chevron_right,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).listRowSeparator,
            ),
          ),
        ],
      ),
    );
  }
}
