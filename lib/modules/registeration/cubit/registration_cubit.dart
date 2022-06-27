import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/models/parent_model.dart';
import 'package:mamy_guide/shared/components/constants.dart';
import 'package:mamy_guide/shared/network/local/cashed_helper.dart';
import 'package:mamy_guide/user_type_enum.dart';

import '../../../models/doctor_model.dart';
import 'registration_states.dart';

class RegistrationCubit extends Cubit<RegistrationStates> {
  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  ParentModel? parentModel;
  DoctorModel? doctorModel;

  //----------------------------------------------------------------------------
  //Parent Screen TextFormFields Controller

  var parentNameController = TextEditingController();
  var parentEmailController = TextEditingController();
  var parentPasswordController = TextEditingController();
  var parentPhoneNumberController = TextEditingController();
  var babyNameController = TextEditingController();
  var birthDayController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();
  var bloodTypeController = TextEditingController();

  //----------------------------------------------------------------------------
  //Doctor Screen TextFormFields Controller

  var doctorNameController = TextEditingController();
  var doctorEmailController = TextEditingController();
  var doctorPasswordController = TextEditingController();
  var doctorPhoneNumberController = TextEditingController();
  var doctorYearsOfExperienceController = TextEditingController();
  var doctorSpecialtyController = TextEditingController();
  var doctorRateController = TextEditingController();
  var doctorAvailableDaysController = TextEditingController();

  //----------------------------------------------------------------------------

  List<UserType> typeOfUser = [
    UserType.Parent,
    UserType.Doctor,
  ];
  UserType typeOfUserValue = UserType.Parent;

  //----------------------------------------------------------------------------

  void changeTypeOfUser(UserType type) {
    typeOfUserValue = type;
    emit(RegistrationChangeTypeOfUserState());
  }

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

  Future<void> addNewParent() async {
    emit(AddNewParentLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: parentEmailController.text,
      password: parentPasswordController.text,
    )
        .then((value) {
      uId = value.user!.uid;
      CashedHelper.putData(key: uIdKey, value: value.user!.uid);
      CashedHelper.putData(key: userTypeKey, value: parentKey);
      print(uId);
      createNewParent();
      emit(AddNewParentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddNewParentErrorState());
    });
  }

  void createNewParent() {
    emit(CreateNewParentLoadingState());
    parentModel = ParentModel(
      uId,
      parentNameController.text,
      parentEmailController.text,
      parentPhoneNumberController.text,
      babyNameController.text,
      birthDayController.text,
      genderController.text,
      addressController.text,
      bloodTypeController.text,
    );
    FirebaseFirestore.instance
        .collection('parents')
        .doc(uId)
        .set(parentModel!.toJson())
        .then((value) {
      emit(CreateNewParentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewParentErrorState());
    });
  }

  Future<void> addNewDoctor() async {
    emit(AddNewDoctorLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: doctorEmailController.text,
      password: doctorPasswordController.text,
    )
        .then((value) {
      uId = value.user!.uid;
      CashedHelper.putData(key: uIdKey, value: value.user!.uid);
      CashedHelper.putData(key: userTypeKey, value: doctorKey);
      print(uId);
      createNewDoctor();
      emit(AddNewDoctorSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddNewDoctorErrorState());
    });
  }

  void createNewDoctor() {
    emit(CreateNewDoctorLoadingState());
    doctorModel = DoctorModel(
      uId,
      doctorNameController.text,
      doctorEmailController.text,
      doctorPhoneNumberController.text,
      doctorYearsOfExperienceController.text,
      doctorSpecialtyController.text,
      0,
      0,
    );
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(uId)
        .set(doctorModel!.toJson())
        .then((value) {
      emit(CreateNewDoctorSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewDoctorErrorState());
    });
  }
}
