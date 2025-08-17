import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_notification_model.dart';
export 'row_notification_model.dart';

class RowNotificationWidget extends StatefulWidget {
  const RowNotificationWidget({super.key});

  @override
  State<RowNotificationWidget> createState() => _RowNotificationWidgetState();
}

class _RowNotificationWidgetState extends State<RowNotificationWidget> {
  late RowNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowNotificationModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Color(0x19000000),
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).rowStroke,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '2 days ago',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.figtree(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).textMatchingPrimary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
            ),
            Text(
              'You\'ve been invited to join ⚽️ Monday Blijdorp ',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.figtree(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
