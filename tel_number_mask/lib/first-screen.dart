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

    return Center(
      child: Container(
          child: BlocProvider(
              create: (BuildContext context) => TelcheckCubit(),
              child: BlocBuilder<TelcheckCubit, TelcheckState>(builder: (context, state) {
                if (state is UpState) {
                  telNumber = state.val;
                }
                return TextFormField(
                  decoration: InputDecoration(
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
                    BlocProvider.of<TelcheckCubit>(context).checkTel(telNumber);
                  },
                  maxLines: 1,
                );
              }))),
    );
  }
}
