import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_dashboard_widget.dart' show PageDashboardWidget;
import 'package:flutter/material.dart';

class PageDashboardModel extends FlutterFlowModel<PageDashboardWidget> {
  ///  Local state fields for this page.

  int? dashboardSelectedPage = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PageDashboard widget.
  List<MembersRecord>? membersForUser;
  // Stores action output result for [Firestore Query - Query a collection] action in PageDashboard widget.
  List<MatchesRecord>? matchesForUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
