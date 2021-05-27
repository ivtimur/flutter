import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../check-mask.dart';

part 'telcheck_state.dart';

class TelcheckCubit extends Cubit<TelcheckState> {
  TelcheckCubit() : super(TelcheckInitial());

  Future<void> checkTel(TextEditingController val, {String mask = '+_ (___) ___ __ __'}) async {
    
    // just call CheckMask.checkTel(val, mask: mask)
    // in default mask = '+_ (___) ___ __ __'
    // also you can call this metod in StateFullWidget

    val = await CheckMask.checkTel(val, mask: mask);

    emit(UpState(val));
  }

}
