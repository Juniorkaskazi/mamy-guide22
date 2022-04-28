import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cashed_helper.dart';
import '../../../user_type_enum.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();

  List<UserType> typeOfUser = [
    UserType.Parent,
    UserType.Doctor,
  ];
  UserType typeOfUserValue = UserType.Parent;

  void changeTypeOfUser(UserType type) {
    typeOfUserValue = type;
    emit(LoginChangeTypeOfUserState());
  }

  void loginUser() {
    emit(LoginUserLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailLoginController.text,
      password: passwordLoginController.text,
    )
        .then((value) {
      uId = value.user!.uid;
      if (typeOfUserValue == UserType.Parent) {
        FirebaseFirestore.instance
            .collection('parents')
            .doc(uId)
            .get()
            .then((value) {
          print(value.data());
          if (value.data() != null) {
            userType = parentKey;
            CashedHelper.putData(key: userTypeKey, value: parentKey);
            CashedHelper.putData(key: uIdKey, value: uId);
            emit(LoginParentSuccessState());
          } else {
            emit(LoginParentErrorState());
          }
        }).catchError((error) {
          print(error.toString());
          emit(LoginParentErrorState());
        });
      } else {
        FirebaseFirestore.instance
            .collection('doctors')
            .doc(uId)
            .get()
            .then((value) {
          if (value.data() != null) {
            userType = doctorKey;
            CashedHelper.putData(key: userTypeKey, value: doctorKey);
            CashedHelper.putData(key: uIdKey, value: uId);
            emit(LoginDoctorSuccessState());
          } else {
            emit(LoginDoctorErrorState());
          }
        }).catchError((error) {
          print(error.toString());
          emit(LoginDoctorErrorState());
        });
      }
      print(uId);
    }).catchError(
      (error) {
        print(error.toString());
        emit(LoginUserErrorState());
      },
    );
  }
}
