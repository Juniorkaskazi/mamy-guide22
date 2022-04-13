import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cashed_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();

  void loginUser() {
    emit(LoginUserLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailLoginController.text,
      password: passwordLoginController.text,
    )
        .then((value) {
      uId = value.user!.uid;
      CashedHelper.putData(key: uIdKey, value: value.user!.uid);
      print(uId);
      emit(LoginUserSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(LoginUserErrorState());
      },
    );
  }
}
