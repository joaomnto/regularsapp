import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Default date for date picker
  DateTime? _datePickerDefault =
      DateTime.fromMillisecondsSinceEpoch(1754488800000);
  DateTime? get datePickerDefault => _datePickerDefault;
  set datePickerDefault(DateTime? value) {
    _datePickerDefault = value;
  }
}
