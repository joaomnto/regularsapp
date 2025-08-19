import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sheet_create_edit_match_model.dart';
export 'sheet_create_edit_match_model.dart';

class SheetCreateEditMatchWidget extends StatefulWidget {
  const SheetCreateEditMatchWidget({
    super.key,
    this.groupRef,
    this.matchRef,
    this.group,
    bool? userIsAdmin,
    this.match,
  }) : this.userIsAdmin = userIsAdmin ?? false;

  final DocumentReference? groupRef;
  final DocumentReference? matchRef;
  final GroupsRecord? group;
  final bool userIsAdmin;
  final MatchesRecord? match;

  @override
  State<SheetCreateEditMatchWidget> createState() =>
      _SheetCreateEditMatchWidgetState();
}

class _SheetCreateEditMatchWidgetState
    extends State<SheetCreateEditMatchWidget> {
  late SheetCreateEditMatchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SheetCreateEditMatchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.match?.reference != null) {
        _model.matchType = widget.match?.type?.name;
        _model.venue = widget.match?.venue?.name;
        _model.subs = widget.match?.subs?.name;
        _model.isRecurring = widget.match!.isRecurring;
        _model.selectedDate = widget.match?.matchDate;
        _model.selectedTime = widget.match?.matchDate;
        _model.selectedDuration = widget.match?.duration;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                valueOrDefault<String>(
                  widget.match != null ? 'Edit Match' : 'New Match',
                  'Edit Match',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.close_outlined,
                    color: FlutterFlowTheme.of(context).backButtons,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    if (widget.matchRef != null) {
                      await widget.matchRef!.update({
                        ...mapToFirestore(
                          {
                            'editingAt': FieldValue.delete(),
                            'editingBy': FieldValue.delete(),
                            'editingByName': FieldValue.delete(),
                          },
                        ),
                      });
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            Flexible(
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Date',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked1Date =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      (_model.selectedDate ??
                                                          DateTime.now()),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2050),
                                                  builder: (context, child) {
                                                    return wrapInMaterialDatePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );

                                                if (_datePicked1Date != null) {
                                                  safeSetState(() {
                                                    _model.datePicked1 =
                                                        DateTime(
                                                      _datePicked1Date.year,
                                                      _datePicked1Date.month,
                                                      _datePicked1Date.day,
                                                    );
                                                  });
                                                } else if (_model.datePicked1 !=
                                                    null) {
                                                  safeSetState(() {
                                                    _model.datePicked1 =
                                                        _model.selectedDate;
                                                  });
                                                }
                                                _model.selectedDate =
                                                    _model.datePicked1;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 110.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x80A37FD6),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "d",
                                                          _model.selectedDate,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '-',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      '/',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "MM",
                                                          _model.selectedDate,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '-',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Kick-off',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font: GoogleFonts.figtree(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePicked2Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay
                                                      .fromDateTime(((_model
                                                                      .selectedTime !=
                                                                  null
                                                              ? _model
                                                                  .selectedTime
                                                              : FFAppState()
                                                                  .datePickerDefault) ??
                                                          DateTime.now())),
                                                  builder: (context, child) {
                                                    return wrapInMaterialTimePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );
                                                if (_datePicked2Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked2 =
                                                        DateTime(
                                                      ((_model.selectedTime !=
                                                                      null
                                                                  ? _model
                                                                      .selectedTime
                                                                  : FFAppState()
                                                                      .datePickerDefault) ??
                                                              DateTime.now())
                                                          .year,
                                                      ((_model.selectedTime !=
                                                                      null
                                                                  ? _model
                                                                      .selectedTime
                                                                  : FFAppState()
                                                                      .datePickerDefault) ??
                                                              DateTime.now())
                                                          .month,
                                                      ((_model.selectedTime !=
                                                                      null
                                                                  ? _model
                                                                      .selectedTime
                                                                  : FFAppState()
                                                                      .datePickerDefault) ??
                                                              DateTime.now())
                                                          .day,
                                                      _datePicked2Time.hour,
                                                      _datePicked2Time.minute,
                                                    );
                                                  });
                                                } else if (_model.datePicked2 !=
                                                    null) {
                                                  safeSetState(() {
                                                    _model.datePicked2 = (_model
                                                                .selectedTime !=
                                                            null
                                                        ? _model.selectedTime
                                                        : FFAppState()
                                                            .datePickerDefault);
                                                  });
                                                }
                                                _model.selectedTime =
                                                    _model.datePicked2;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 110.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x80A37FD6),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "H",
                                                          _model.selectedTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '-',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      ':',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "mm",
                                                          _model.selectedTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '-',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .figtree(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.map,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
                                                      Text(
                                                        'Location',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .figtree(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      widget
                                                          .match?.locationName,
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowPlacePicker(
                                                          iOSGoogleMapsApiKey:
                                                              'AIzaSyDpjKm8eH3j5EhjtAHRmiRDC3xR9c1HPas',
                                                          androidGoogleMapsApiKey:
                                                              'AIzaSyCovDd5jFS2Mb9CGeBBBONomJzRzDhN3mU',
                                                          webGoogleMapsApiKey:
                                                              'AIzaSyAyB9f3awufV8tkqsIY6Vanv9CD38fTp6Q',
                                                          onSelect:
                                                              (place) async {
                                                            safeSetState(() =>
                                                                _model.placePickerValue =
                                                                    place);
                                                          },
                                                          defaultText:
                                                              'Select Location',
                                                          icon: Icon(
                                                            Icons.place,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 15.0,
                                                          ),
                                                          buttonOptions:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .figtree(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.timer_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
                                                      Text(
                                                        'Duration',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .figtree(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                  Text(
                                                    '${functions.doubleToIntString(_model.sliderValue)} min',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  min: 0.0,
                                                  max: 240.0,
                                                  value: _model.sliderValue ??=
                                                      valueOrDefault<double>(
                                                    widget.match?.duration,
                                                    90.0,
                                                  ),
                                                  divisions: 48,
                                                  onChanged: (newValue) async {
                                                    newValue = double.parse(
                                                        newValue
                                                            .toStringAsFixed(
                                                                0));
                                                    safeSetState(() =>
                                                        _model.sliderValue =
                                                            newValue);
                                                    _model.selectedDuration =
                                                        _model.sliderValue;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.sports_soccer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                  Text(
                                                    'Match Type',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .matchTypeDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.matchTypeDropDownValue ??=
                                                      widget.match?.type?.name,
                                                ),
                                                options: List<String>.from(
                                                    MatchType.values
                                                        .map((e) => e.name)
                                                        .toList()),
                                                optionLabels: functions
                                                    .matchTypeDisplayStrings(
                                                        MatchType.values
                                                            .toList()),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .matchTypeDropDownValue =
                                                        val),
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Select',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.sunny,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                  Text(
                                                    'Venue',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .venueDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.venueDropDownValue ??=
                                                      widget
                                                          .match?.venue?.name,
                                                ),
                                                options: VenueType.values
                                                    .map((e) => e.name)
                                                    .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .venueDropDownValue =
                                                        val),
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Select',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.timer_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 18.0,
                                                  ),
                                                  Text(
                                                    'Subs',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .figtree(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .subsDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.subsDropDownValue ??=
                                                      widget.match?.subs?.name,
                                                ),
                                                options: SubsType.values
                                                    .map((e) => e.name)
                                                    .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .subsDropDownValue =
                                                        val),
                                                width: 200.0,
                                                height: 40.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Select',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 20.0))
                                          .around(SizedBox(height: 20.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (widget.match != null) {
                                            if (widget.match?.groupRef !=
                                                null) {
                                              await widget.matchRef!.update({
                                                ...createMatchesRecordData(
                                                  venue: functions
                                                      .stringToVenueType(_model
                                                          .venueDropDownValue),
                                                  type: functions
                                                      .stringToMatchType(_model
                                                          .matchTypeDropDownValue),
                                                  subs: functions
                                                      .stringToSubsType(_model
                                                          .subsDropDownValue),
                                                  isRecurring:
                                                      _model.isRecurring,
                                                  duration:
                                                      _model.selectedDuration,
                                                  matchDate: functions
                                                      .combineDateAndTime(
                                                          _model.selectedDate,
                                                          _model.selectedTime),
                                                  matchEndDate: functions
                                                      .dateTimePlusMinutes(
                                                          _model
                                                              .selectedDuration,
                                                          functions.combineDateAndTime(
                                                              _model
                                                                  .selectedDate,
                                                              _model
                                                                  .selectedTime)!),
                                                  location: _model
                                                      .placePickerValue.latLng,
                                                  locationName: _model
                                                      .placePickerValue.name,
                                                  groupName:
                                                      widget.group?.name,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'editingBy':
                                                        FieldValue.delete(),
                                                    'editingByName':
                                                        FieldValue.delete(),
                                                    'editingAt':
                                                        FieldValue.delete(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await widget.matchRef!.update({
                                                ...createMatchesRecordData(
                                                  venue: functions
                                                      .stringToVenueType(_model
                                                          .venueDropDownValue),
                                                  type: functions
                                                      .stringToMatchType(_model
                                                          .matchTypeDropDownValue),
                                                  subs: functions
                                                      .stringToSubsType(_model
                                                          .subsDropDownValue),
                                                  isRecurring:
                                                      _model.isRecurring,
                                                  duration:
                                                      _model.selectedDuration,
                                                  matchDate: functions
                                                      .combineDateAndTime(
                                                          _model.selectedDate,
                                                          _model.selectedTime),
                                                  matchEndDate: functions
                                                      .dateTimePlusMinutes(
                                                          _model
                                                              .selectedDuration,
                                                          functions.combineDateAndTime(
                                                              _model
                                                                  .selectedDate,
                                                              _model
                                                                  .selectedTime)!),
                                                  location: _model
                                                      .placePickerValue.latLng,
                                                  locationName: _model
                                                      .placePickerValue.name,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'editingBy':
                                                        FieldValue.delete(),
                                                    'editingAt':
                                                        FieldValue.delete(),
                                                    'editingByName':
                                                        FieldValue.delete(),
                                                  },
                                                ),
                                              });
                                            }
                                          } else {
                                            if ((_model.selectedDate != null) &&
                                                (_model.selectedTime != null)) {
                                              if (widget.groupRef != null) {
                                                _model.membersList =
                                                    await queryMembersRecordOnce(
                                                  parent: widget.groupRef,
                                                  queryBuilder:
                                                      (membersRecord) =>
                                                          membersRecord.where(
                                                    'isPlayer',
                                                    isEqualTo: true,
                                                  ),
                                                );
                                                for (int loop1Index = 0;
                                                    loop1Index <
                                                        _model.membersList!
                                                            .length;
                                                    loop1Index++) {
                                                  final currentLoop1Item =
                                                      _model.membersList![
                                                          loop1Index];
                                                  _model
                                                      .addToTempAttendanceList(
                                                          MatchAttendanceStruct(
                                                    status: AttendanceStatus
                                                        .noReply,
                                                    player:
                                                        EmbeddedPlayerStruct(
                                                      name:
                                                          currentLoop1Item.name,
                                                      photoUrl: currentLoop1Item
                                                          .photoUrl,
                                                      userRefId:
                                                          currentLoop1Item
                                                              .userRef,
                                                      memberRefId:
                                                          currentLoop1Item
                                                              .reference,
                                                    ),
                                                  ));
                                                  safeSetState(() {});
                                                }

                                                var matchesRecordReference1 =
                                                    MatchesRecord.collection
                                                        .doc();
                                                await matchesRecordReference1
                                                    .set({
                                                  ...createMatchesRecordData(
                                                    matchDate: functions
                                                        .combineDateAndTime(
                                                            _model.datePicked1,
                                                            _model.datePicked2),
                                                    venue: functions
                                                        .stringToVenueType(_model
                                                            .venueDropDownValue),
                                                    status:
                                                        MatchStatus.Scheduled,
                                                    subs: functions
                                                        .stringToSubsType(_model
                                                            .subsDropDownValue),
                                                    type: functions
                                                        .stringToMatchType(_model
                                                            .matchTypeDropDownValue),
                                                    isRecurring: false,
                                                    duration:
                                                        _model.sliderValue,
                                                    groupRef: widget.groupRef,
                                                    recurringId:
                                                        _model.isRecurring
                                                            ? random_data
                                                                .randomString(
                                                                10,
                                                                10,
                                                                true,
                                                                true,
                                                                true,
                                                              )
                                                            : '',
                                                    matchEndDate: functions
                                                        .dateTimePlusMinutes(
                                                            _model.sliderValue,
                                                            functions.combineDateAndTime(
                                                                _model
                                                                    .selectedDate,
                                                                _model
                                                                    .selectedTime)!),
                                                    location: _model
                                                        .placePickerValue
                                                        .latLng,
                                                    locationName: _model
                                                        .placePickerValue.name,
                                                    groupName:
                                                        widget.group?.name,
                                                    createdBy:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'attendance':
                                                          getMatchAttendanceListFirestoreData(
                                                        _model
                                                            .tempAttendanceList,
                                                      ),
                                                      'matchGroupMembers': functions
                                                          .memberRefsFromAttendance(
                                                              _model
                                                                  .tempAttendanceList
                                                                  .toList()),
                                                      'attendanceUserRefs': functions
                                                          .userRefsFromAttendanceList(
                                                              _model
                                                                  .tempAttendanceList
                                                                  .toList()),
                                                      'createdIn': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                _model.createdMatch =
                                                    MatchesRecord
                                                        .getDocumentFromData({
                                                  ...createMatchesRecordData(
                                                    matchDate: functions
                                                        .combineDateAndTime(
                                                            _model.datePicked1,
                                                            _model.datePicked2),
                                                    venue: functions
                                                        .stringToVenueType(_model
                                                            .venueDropDownValue),
                                                    status:
                                                        MatchStatus.Scheduled,
                                                    subs: functions
                                                        .stringToSubsType(_model
                                                            .subsDropDownValue),
                                                    type: functions
                                                        .stringToMatchType(_model
                                                            .matchTypeDropDownValue),
                                                    isRecurring: false,
                                                    duration:
                                                        _model.sliderValue,
                                                    groupRef: widget.groupRef,
                                                    recurringId:
                                                        _model.isRecurring
                                                            ? random_data
                                                                .randomString(
                                                                10,
                                                                10,
                                                                true,
                                                                true,
                                                                true,
                                                              )
                                                            : '',
                                                    matchEndDate: functions
                                                        .dateTimePlusMinutes(
                                                            _model.sliderValue,
                                                            functions.combineDateAndTime(
                                                                _model
                                                                    .selectedDate,
                                                                _model
                                                                    .selectedTime)!),
                                                    location: _model
                                                        .placePickerValue
                                                        .latLng,
                                                    locationName: _model
                                                        .placePickerValue.name,
                                                    groupName:
                                                        widget.group?.name,
                                                    createdBy:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'attendance':
                                                          getMatchAttendanceListFirestoreData(
                                                        _model
                                                            .tempAttendanceList,
                                                      ),
                                                      'matchGroupMembers': functions
                                                          .memberRefsFromAttendance(
                                                              _model
                                                                  .tempAttendanceList
                                                                  .toList()),
                                                      'attendanceUserRefs': functions
                                                          .userRefsFromAttendanceList(
                                                              _model
                                                                  .tempAttendanceList
                                                                  .toList()),
                                                      'createdIn':
                                                          DateTime.now(),
                                                    },
                                                  ),
                                                }, matchesRecordReference1);
                                              } else {
                                                var matchesRecordReference2 =
                                                    MatchesRecord.collection
                                                        .doc();
                                                await matchesRecordReference2
                                                    .set({
                                                  ...createMatchesRecordData(
                                                    matchDate: functions
                                                        .combineDateAndTime(
                                                            _model.datePicked1,
                                                            _model.datePicked2),
                                                    venue: functions
                                                        .stringToVenueType(_model
                                                            .venueDropDownValue),
                                                    status:
                                                        MatchStatus.Scheduled,
                                                    subs: functions
                                                        .stringToSubsType(_model
                                                            .subsDropDownValue),
                                                    type: functions
                                                        .stringToMatchType(_model
                                                            .matchTypeDropDownValue),
                                                    isRecurring: false,
                                                    duration:
                                                        _model.sliderValue,
                                                    recurringId:
                                                        _model.isRecurring
                                                            ? random_data
                                                                .randomString(
                                                                10,
                                                                10,
                                                                true,
                                                                true,
                                                                true,
                                                              )
                                                            : '',
                                                    matchEndDate: functions
                                                        .dateTimePlusMinutes(
                                                            _model.sliderValue,
                                                            functions.combineDateAndTime(
                                                                _model
                                                                    .selectedDate,
                                                                _model
                                                                    .selectedTime)!),
                                                    location: _model
                                                        .placePickerValue
                                                        .latLng,
                                                    locationName: _model
                                                        .placePickerValue.name,
                                                    createdBy:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'attendance': [
                                                        getMatchAttendanceFirestoreData(
                                                          createMatchAttendanceStruct(
                                                            status:
                                                                AttendanceStatus
                                                                    .noReply,
                                                            player:
                                                                updateEmbeddedPlayerStruct(
                                                              EmbeddedPlayerStruct(
                                                                name:
                                                                    currentUserDisplayName,
                                                                photoUrl:
                                                                    currentUserPhoto,
                                                                userRefId:
                                                                    currentUserReference,
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                            userRefId:
                                                                currentUserReference,
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          true,
                                                        )
                                                      ],
                                                      'attendanceUserRefs': [
                                                        currentUserReference
                                                      ],
                                                      'createdIn': FieldValue
                                                          .serverTimestamp(),
                                                      'matchAdmins': [
                                                        currentUserUid
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.createdSigleMatch =
                                                    MatchesRecord
                                                        .getDocumentFromData({
                                                  ...createMatchesRecordData(
                                                    matchDate: functions
                                                        .combineDateAndTime(
                                                            _model.datePicked1,
                                                            _model.datePicked2),
                                                    venue: functions
                                                        .stringToVenueType(_model
                                                            .venueDropDownValue),
                                                    status:
                                                        MatchStatus.Scheduled,
                                                    subs: functions
                                                        .stringToSubsType(_model
                                                            .subsDropDownValue),
                                                    type: functions
                                                        .stringToMatchType(_model
                                                            .matchTypeDropDownValue),
                                                    isRecurring: false,
                                                    duration:
                                                        _model.sliderValue,
                                                    recurringId:
                                                        _model.isRecurring
                                                            ? random_data
                                                                .randomString(
                                                                10,
                                                                10,
                                                                true,
                                                                true,
                                                                true,
                                                              )
                                                            : '',
                                                    matchEndDate: functions
                                                        .dateTimePlusMinutes(
                                                            _model.sliderValue,
                                                            functions.combineDateAndTime(
                                                                _model
                                                                    .selectedDate,
                                                                _model
                                                                    .selectedTime)!),
                                                    location: _model
                                                        .placePickerValue
                                                        .latLng,
                                                    locationName: _model
                                                        .placePickerValue.name,
                                                    createdBy:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'attendance': [
                                                        getMatchAttendanceFirestoreData(
                                                          createMatchAttendanceStruct(
                                                            status:
                                                                AttendanceStatus
                                                                    .noReply,
                                                            player:
                                                                updateEmbeddedPlayerStruct(
                                                              EmbeddedPlayerStruct(
                                                                name:
                                                                    currentUserDisplayName,
                                                                photoUrl:
                                                                    currentUserPhoto,
                                                                userRefId:
                                                                    currentUserReference,
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                            userRefId:
                                                                currentUserReference,
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          true,
                                                        )
                                                      ],
                                                      'attendanceUserRefs': [
                                                        currentUserReference
                                                      ],
                                                      'createdIn':
                                                          DateTime.now(),
                                                      'matchAdmins': [
                                                        currentUserUid
                                                      ],
                                                    },
                                                  ),
                                                }, matchesRecordReference2);
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Date & Time'),
                                                    content: Text(
                                                        'Please select a date and time for this match'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          context.safePop();

                                          safeSetState(() {});
                                        },
                                        text: widget.match != null
                                            ? 'Save'
                                            : 'Create Match',
                                        options: FFButtonOptions(
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.figtree(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.1,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                      ),
                                    ),
                                    if (widget.userIsAdmin &&
                                        (widget.match != null))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Delete Match'),
                                                          content: Text(
                                                              'Are you sure? All the data related to this match will be lost'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Delete'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await widget.matchRef!.delete();
                                              context.safePop();
                                              context.safePop();
                                            } else {
                                              return;
                                            }
                                          },
                                          text: 'Delete match',
                                          options: FFButtonOptions(
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x004709A4),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      font: GoogleFonts.figtree(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF939393),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .addToStart(SizedBox(height: 1.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 40.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
