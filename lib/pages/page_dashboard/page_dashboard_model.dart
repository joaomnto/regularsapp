import '/components/groups_list/groups_list_widget.dart';
import '/components/rows/row_match_day_copy/row_match_day_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_dashboard_widget.dart' show PageDashboardWidget;
import 'package:flutter/material.dart';

class PageDashboardModel extends FlutterFlowModel<PageDashboardWidget> {
  ///  Local state fields for this page.

  int? dashboardSelectedPage = 1;

  ///  State fields for stateful widgets in this page.

  // Model for RowMatchDayCopy component.
  late RowMatchDayCopyModel rowMatchDayCopyModel;
  // Model for GroupsList component.
  late GroupsListModel groupsListModel;

  @override
  void initState(BuildContext context) {
    rowMatchDayCopyModel = createModel(context, () => RowMatchDayCopyModel());
    groupsListModel = createModel(context, () => GroupsListModel());
  }

  @override
  void dispose() {
    rowMatchDayCopyModel.dispose();
    groupsListModel.dispose();
  }
}
