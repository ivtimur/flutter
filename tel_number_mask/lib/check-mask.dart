import 'package:flutter/material.dart';

abstract class CheckMask {
  static checkTel(TextEditingValue val, {String mask = '+_ (___) ___ __ __'}) {
    Map<String, dynamic> res = _check(val.text, val.selection.base.offset, mask);

    val = TextEditingValue(
      text: res['number'],
      selection: TextSelection.fromPosition(
          ((val.selection.base.offset + (res['pos'] as int)) < res['number'].length)
              ? TextPosition(offset: (val.selection.base.offset + (res['pos'] as int)))
              : TextPosition(offset: res['number'].length)),
    );

    return val;
  }

  static _check(String numberG, int pos, String mask) {
    String number = numberG;
    if (number.length > mask.length)
      number = number.substring(0, number.length - (number.length - mask.length));
    String tmp = '';
    int _pos = 0;
    for (var i = 0; i < number.length; i++) {
      if ('1234567890'.contains(number[i])) tmp += number[i];
    }
    number = '';
    var j = 0;
    for (var i = 0; i < mask.length; i++) {
      if (j < tmp.length) {
        if ((mask[i] == '_')) {
          number += tmp[j];
          j++;
        } else {
          if (mask[i] == tmp[j]) j++;
          if (numberG.length == pos) _pos++;
          number += mask[i];
        }
      }
    }

    return {'number': number, 'pos': _pos};
  }
}
