part of 'telcheck_cubit.dart';

@immutable
abstract class TelcheckState {}

class TelcheckInitial extends TelcheckState {}

class UpState extends TelcheckState {
  final TextEditingController val;
  UpState(this.val);
}
