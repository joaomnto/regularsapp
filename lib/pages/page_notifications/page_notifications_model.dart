import '/components/rows/row_notification/row_notification_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_notifications_widget.dart' show PageNotificationsWidget;
import 'package:flutter/material.dart';

class PageNotificationsModel extends FlutterFlowModel<PageNotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RowNotification component.
  late RowNotificationModel rowNotificationModel;

  @override
  void initState(BuildContext context) {
    rowNotificationModel = createModel(context, () => RowNotificationModel());
  }

  @override
  void dispose() {
    rowNotificationModel.dispose();
  }
}
