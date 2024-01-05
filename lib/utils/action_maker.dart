import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constant/calculator_keys.dart';
import '../model/calculator_model.dart';

class ActionMaker {
  static void keyPressed(BuildContext context, String value, KeyType keyType) {
    final provider = Provider.of<CalculatorModel>(context, listen: false);
    final operations = provider.operations;

    String? lastValue = operations.isNotEmpty ? operations.last : null;
    KeyType? lastValueType = CalculatorKeys.keys[lastValue];

    if (keyType == KeyType.helper) {
      if (value == "AC") {
        provider.updateResult("");
        provider.clearOperations();
      } else if (value == "C") {
        provider.deleteOneChar();
      }
    } else if (keyType == KeyType.operator) {
      if (operations.length > 2) {
        provider.updateResult(_calculate(operations));
      }
      if (operations.isNotEmpty) {
        if (value != "=") {
          if (lastValueType == KeyType.operator) {
            provider.updateLastOperation(value);
          } else {
            if (lastValue!.endsWith(".")) {
              provider.updateLastOperation(
                  lastValue.substring(0, lastValue.length - 1));
            }
            provider.addToOperations(value);
          }
        }
      }
    } else {
      if (operations.isNotEmpty) {
        if (lastValue!.length > 8) {
          return;
        }
      }

      if (lastValue == null || lastValueType == KeyType.operator) {
        if (value == ".") {
          provider.addToOperations("0.");
        } else if (value != "0") {
          provider.addToOperations(value);
        }
      } else {
        if (value == ".") {
          if (lastValue.contains(".") == false) {
            provider.updateLastOperation(lastValue + value);
          }
        } else {
          provider.updateLastOperation(lastValue + value);
        }
      }
    }
  }

  static String _calculate(List<String> operations) {
    List<String> values = List<String>.from(operations);

    if (CalculatorKeys.keys[values.last] == KeyType.operator) {
      values.removeLast();
    }

    for (var index = 1; index < values.length; index += 2) {
      double? valueA = double.tryParse(values[index - 1]);
      String operator = values[index];
      double? valueB = double.tryParse(values[index + 1]);

      if (valueA == null || valueB == null) continue;

      double result = 0.0;
      if (operator == "x") {
        result = valueA * valueB;
      } else if (operator == "÷") {
        result = valueA / valueB;
      } else if (operator == "-") {
        result = valueA - valueB;
      } else if (operator == "+") {
        result = valueA + valueB;
      } else if (operator == "%") {
        result = (valueA * valueB) / 100;
      }
      values[index - 1] = '';
      values[index] = '';
      values[index + 1] = result.toString();
    }

    return _fixedResult(values.last);
  }

  static String _fixedResult(String strNumber) {
    double? number = double.tryParse(strNumber);

    if (number == null) return "0";

    if (number % 1 == 0) return number.round().toString();

    if (number.round().toString().length > 9) {
      return number.toStringAsExponential(2);
    }

    if (double.parse(number.toStringAsFixed(2)) ==
        double.parse(number.toStringAsFixed(1))) {
      return number.toStringAsFixed(1);
    }

    return number.toStringAsFixed(2);
  }
}
