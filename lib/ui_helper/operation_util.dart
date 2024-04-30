import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OperationUtil{
  GetOperationButton(operandOneController, operandTwoController, result, operationType, callerSetState){
    var icon = FontAwesomeIcons.add;

    if(operationType == '+') {
      icon = FontAwesomeIcons.add;
    }else if(operationType == '-') {
      icon = FontAwesomeIcons.subtract;
    }else if(operationType == 'x') {
      icon = FontAwesomeIcons.multiply;
    }else if(operationType == '/') {
      icon = FontAwesomeIcons.divide;
    }

    return IconButton(
        onPressed: () {
          var operand1 = double.tryParse(
              operandOneController.text.toString());
          var operand2 = double.tryParse(
              operandTwoController.text.toString());

          if (operand1 != null && operand2 != null) {
            if(operationType == '+') {
              result = operand1 + operand2;
            }else if(operationType == '-') {
              result = operand1 - operand2;
            }else if(operationType == 'x') {
              result = operand1 * operand2;
            }else if(operationType == '/') {
              result = operand1 / operand2;
            }
          }
          print(result);
          callerSetState(result);
        },
        icon: FaIcon(icon)
    );
  }
}