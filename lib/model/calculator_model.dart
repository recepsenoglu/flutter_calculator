import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String _operationHistory = "1+1";
  String _result = "0";

  String get operationHistory => _operationHistory;
  String get result => _result;

  void updateOperationHistory(String value) {
    _operationHistory = value;
    notifyListeners();
  }

  void updateResult(String value) {
    _result = value;
    notifyListeners();
  }
}
