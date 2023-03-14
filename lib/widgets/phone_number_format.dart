import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int index = newValue.selection.end;
    int usedSubstringIndex = 0;

    final StringBuffer newText = new StringBuffer();

    if (newValue.text.isEmpty) return newValue;
    if (newValue.text.length < oldValue.text.length) return oldValue;

    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) {
        index++;
      }
    }

    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) {
        index += 2;
      }
    }

    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) {
        index++;
      }
    }

    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) {
        index++;
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: index),
    );
  }
}
