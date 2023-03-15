import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var index = 0;
    var formatted = '';

    for (var i = 0; i < text.length; i++) {
      if (text[i] == '(' ||
          text[i] == ')' ||
          text[i] == ' ' ||
          text[i] == '-') {
        continue;
      }

      if (index == 0) {
        formatted += '(';
      } else if (index == 3) {
        formatted += ') ';
      } else if (index == 6) {
        formatted += '-';
      }

      if (index >= 10) {
        break;
      }

      formatted += text[i];
      index++;
    }

    return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length));
  }
}
