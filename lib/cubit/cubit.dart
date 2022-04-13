import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  var birthDayController = TextEditingController();

  void choseBirthDayDate({
    required BuildContext context,
  }) {
    emit(ChoseBirthDayDateLoadingState());
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((value) {
      birthDayController.text = value.toString();
      emit(ChoseBirthDayDateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChoseBirthDayDateErrorState());
    });
  }
}
