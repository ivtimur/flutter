import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/telcheck_cubit.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TelNumberInput(),
    );
  }
}

class TelNumberInput extends StatelessWidget {
  const TelNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController telNumber = TextEditingController();
    // You can change the mask format as you like
    // Example: +_ (___) ___ __ __
    // Example: +__-(___)-___-__-__
    // Example: +__:___-___-____
    // Example: +__:___-___-____
    // Example: COD_ (___) ___ __ __
    // In the mask, specify the _ character in the place where the number should be
    const String mask = '+_ (___) ___ __ __';
    return Center(
      child: Container(
          child: BlocProvider(
              create: (BuildContext context) => TelcheckCubit(),
              child: BlocBuilder<TelcheckCubit, TelcheckState>(builder: (context, state) {
                if (state is UpState) {
                  telNumber.value = state.val;
                }
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mask: $mask',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  autofocus: true,
                  controller: telNumber,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 20),
                  onChanged: (val) {
                    BlocProvider.of<TelcheckCubit>(context).checkTel(telNumber.value, mask: mask);
                  },
                  maxLines: 1,
                );
              }))),
    );
  }
}
