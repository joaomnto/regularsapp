import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component_match_detail_model.dart';
export 'component_match_detail_model.dart';

class ComponentMatchDetailWidget extends StatefulWidget {
  const ComponentMatchDetailWidget({
    super.key,
    String? text,
    required this.icon,
    bool? editMode,
  })  : this.text = text ?? '',
        this.editMode = editMode ?? false;

  final String text;
  final Widget? icon;
  final bool editMode;

  @override
  State<ComponentMatchDetailWidget> createState() =>
      _ComponentMatchDetailWidgetState();
}

class _ComponentMatchDetailWidgetState
    extends State<ComponentMatchDetailWidget> {
  late ComponentMatchDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentMatchDetailModel());

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
      width: 80.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.editMode
              ? FlutterFlowTheme.of(context).primaryBackground
              : Color(0x00FFFFFF),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.icon!,
            Text(
              widget.text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.lexendDeca(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
