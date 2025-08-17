import '/components/rows/row_notification/row_notification_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_notifications_model.dart';
export 'page_notifications_model.dart';

class PageNotificationsWidget extends StatefulWidget {
  const PageNotificationsWidget({super.key});

  static String routeName = 'PageNotifications';
  static String routePath = '/pageNotifications';

  @override
  State<PageNotificationsWidget> createState() =>
      _PageNotificationsWidgetState();
}

class _PageNotificationsWidgetState extends State<PageNotificationsWidget> {
  late PageNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageNotificationsModel());

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
          title: Text(
            'Notifications',
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
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 30.0,
              buttonSize: 60.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).backButtons,
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ],
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
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      30.0,
                      0,
                      40.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      wrapWithModel(
                        model: _model.rowNotificationModel,
                        updateCallback: () => safeSetState(() {}),
                        child: RowNotificationWidget(),
                      ),
                    ].divide(SizedBox(height: 10.0)),
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
