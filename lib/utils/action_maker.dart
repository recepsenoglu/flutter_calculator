import 'package:flutter/cupertino.dart';
import 'package:flutter_calculator/model/calculator_model.dart';
import 'package:flutter_calculator/product/constant/calculator_keys.dart';
import 'package:provider/provider.dart';

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
            provider.fixLastOperation(value);
          } else {
            if (lastValue!.endsWith(".")) {
              provider.fixLastOperation(
                  lastValue.substring(0, lastValue.length - 1));
            }
            provider.addToOperations(value);
          }
        }
      }
    } else {
      if (lastValueType == KeyType.operator) {
        if (value != "0" && value != ".") {
          provider.addToOperations(value);
        }
      } else {
        if (lastValue == null) {
          if (value != "0" && value != ".") {
            provider.addToOperations(value);
          }
        } else {
          if (value == ".") {
            if (lastValue.contains(".") == false) {
              provider.fixLastOperation(lastValue + value);
            }
          } else {
            provider.fixLastOperation(lastValue + value);
          }
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

    return double.parse(values.last).toStringAsFixed(2);
  }

}
