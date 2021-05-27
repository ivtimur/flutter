import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'telcheck_state.dart';

class TelcheckCubit extends Cubit<TelcheckState> {
  TelcheckCubit() : super(TelcheckInitial());

  Future<void> checkTel(TextEditingController val) async {
    Map<String, dynamic> res = await _check(val.text, val.selection.base.offset);

    val.value = TextEditingValue(
      text: res['number'],
      selection: TextSelection.fromPosition(
          ((val.selection.base.offset + (res['pos'] as int)) < res['number'].length)
              ? TextPosition(offset: (val.selection.base.offset + (res['pos'] as int)))
              : TextPosition(offset: res['number'].length)),
    );

    emit(UpState(val));
  }

  Future<Map<String, dynamic>> _check(String numberG, int pos) async {
    String number = numberG;
    if (number.length > 18) number = number.substring(0, number.length - (number.length - 18));
    const String filter = '+_ (___) ___ __ __';
    String tmp = '';
    int _pos = 0;
    for (var i = 0; i < number.length; i++) {
      if ('1234567890'.contains(number[i])) tmp += number[i];
    }
    number = '';
    var j = 0;
    for (var i = 0; i < filter.length; i++) {
      if (j < tmp.length) {
        if ((filter[i] == '_')) {
          number += tmp[j];
          j++;
        } else {
          if (filter[i] == tmp[j]) j++;
          if (numberG.length == pos) _pos++;
          number += filter[i];
        }
      }
    }

    return {'number': number, 'pos': _pos};
  }
}
