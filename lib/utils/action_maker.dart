import 'dart:developer';

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
      if (operations.isNotEmpty) {
        if (value == "=") {
          if (operations.length > 2) {
            provider.updateResult(_calculate(operations));
            provider.clearOperations();
          }
        } else {
          if (lastValueType == KeyType.operator) {
            provider.fixLastOperation(value);
          } else {
            if (lastValue!.endsWith(".")) {
              provider.fixLastOperation(
                  lastValue.substring(0, lastValue.length - 1));
            }
            provider.addToOperations(value);
            provider.updateResult(_calculate(operations));
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
    log(operations.toString());
  }

  static String _calculate(List<String> operations) {
    // do calculation (gonna fix this later)
    return operations.first;
  }
}
