import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  final List<String> _operations = [];
  String _result = "";

  List<String> get operations => _operations;
  String get result => _result;

  void updateResult(String value) {
    _result = value;
    notifyListeners();
  }

  void addToOperations(String value) {
    _operations.add(value);
    notifyListeners();
  }

  void updateLastOperation(String value) {
    if (_operations.isNotEmpty) {
      _operations.last = value;
    } else {
      _operations.add(value);
    }
    notifyListeners();
  }

  void deleteOneChar() {
    if (_operations.isNotEmpty) {
      String lastValue = _operations.last;
      if (lastValue.length < 2) {
        _operations.removeLast();
      } else {
        _operations.last = lastValue.substring(0, lastValue.length - 1);
      }
    }
    notifyListeners();
  }

  void clearOperations() {
    _operations.clear();
    notifyListeners();
  }
}
