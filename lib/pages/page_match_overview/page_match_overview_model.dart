import '/components/component_match_detail/component_match_detail_widget.dart';
import '/components/component_player_match_overview_row/component_player_match_overview_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_match_overview_widget.dart' show PageMatchOverviewWidget;
import 'package:flutter/material.dart';

class PageMatchOverviewModel extends FlutterFlowModel<PageMatchOverviewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel1;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel2;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel3;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel4;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel5;
  // Model for ComponentMatchDetail component.
  late ComponentMatchDetailModel componentMatchDetailModel6;
  // Model for ComponentPlayerMatchOverviewRow component.
  late ComponentPlayerMatchOverviewRowModel
      componentPlayerMatchOverviewRowModel1;

  @override
  void initState(BuildContext context) {
    componentMatchDetailModel1 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel2 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel3 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel4 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel5 =
        createModel(context, () => ComponentMatchDetailModel());
    componentMatchDetailModel6 =
        createModel(context, () => ComponentMatchDetailModel());
    componentPlayerMatchOverviewRowModel1 =
        createModel(context, () => ComponentPlayerMatchOverviewRowModel());
  }

  @override
  void dispose() {
    componentMatchDetailModel1.dispose();
    componentMatchDetailModel2.dispose();
    componentMatchDetailModel3.dispose();
    componentMatchDetailModel4.dispose();
    componentMatchDetailModel5.dispose();
    componentMatchDetailModel6.dispose();
    componentPlayerMatchOverviewRowModel1.dispose();
  }
}
