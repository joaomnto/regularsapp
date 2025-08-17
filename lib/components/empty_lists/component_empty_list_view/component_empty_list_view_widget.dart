import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component_empty_list_view_model.dart';
export 'component_empty_list_view_model.dart';

class ComponentEmptyListViewWidget extends StatefulWidget {
  const ComponentEmptyListViewWidget({
    super.key,
    String? emptyText,
  }) : this.emptyText = emptyText ?? 'Nothing to see here';

  final String emptyText;

  @override
  State<ComponentEmptyListViewWidget> createState() =>
      _ComponentEmptyListViewWidgetState();
}

class _ComponentEmptyListViewWidgetState
    extends State<ComponentEmptyListViewWidget> {
  late ComponentEmptyListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentEmptyListViewModel());

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
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.emptyText,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.figtree(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}
