import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/models/user_model.dart';
import 'package:mamy_guide/shared/components/constants.dart';
import 'package:mamy_guide/shared/network/local/cashed_helper.dart';

import 'registration_states.dart';

class RegistrationCubit extends Cubit<RegistrationStates> {
  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  UserModel? userModel;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var babyNameController = TextEditingController();
  var birthDayController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();
  var bloodTypeController = TextEditingController();

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

  Future<void> addNewUser() async {
    emit(AddNewUserLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      uId = value.user!.uid;
      CashedHelper.putData(key: uIdKey, value: value.user!.uid);
      print(uId);
      createNewUser();
      emit(AddNewUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddNewUserErrorState());
    });
  }

  void createNewUser() {
    emit(CreateNewUserLoadingState());
    userModel = UserModel(
      uId,
      nameController.text,
      emailController.text,
      phoneNumberController.text,
      babyNameController.text,
      birthDayController.text,
      genderController.text,
      addressController.text,
      bloodTypeController.text,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel!.toJson())
        .then((value) {
      emit(CreateNewUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewUserErrorState());
    });
  }
}
