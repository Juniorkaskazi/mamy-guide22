import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/user_model.dart';
import 'package:mamy_guide/shared/components/constants.dart';

import '../models/home_model.dart';
import '../modules/activity/activity_screen.dart';
import '../modules/chat_with_doctor/chat_with_doctor_screen.dart';
import '../modules/common_diseases/common_diseases_screen.dart';
import '../modules/growth/growth_screen.dart';
import '../modules/medicine/medicine_screen.dart';
import '../modules/nearest _hospitals/nearest_hospitals_screen.dart';
import '../modules/sections_of_age/sections_of_age_screen.dart';
import '../modules/vaccinationsList/vaccinationsList_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<HomeModel> homeModel = [
    HomeModel(
      image: 'assets/images/Growth.png',
      name: 'Growth',
      nextPage: const GrowthScreen(),
    ),
    HomeModel(
      image: 'assets/images/VaccinationsList.png',
      name: 'Vaccinations List',
      nextPage: const VaccinationsListScreen(),
    ),
    HomeModel(
      image: 'assets/images/Places.png',
      name: 'Nearest Hospitals',
      nextPage: const NearestHospitalsScreen(),
    ),
    HomeModel(
      image: 'assets/images/SectionsOfAge.png',
      name: 'Sections Of Age',
      nextPage: SectionsOfAgeScreen(),
    ),
    HomeModel(
      image: 'assets/images/ChatWithDoctor.png',
      name: 'Chat With Doctor',
      nextPage: const ChatWithDoctorScreen(),
    ),
    HomeModel(
      image: 'assets/images/CommonDiseases.png',
      name: 'Common Diseases',
      nextPage: const CommonDiseasesScreen(),
    ),
    HomeModel(
      image: 'assets/images/Medicatin.png',
      name: 'Medicine',
      nextPage: const MedicineScreen(),
    ),
    HomeModel(
      image: 'assets/images/Activity.png',
      name: 'Activity',
      nextPage: const ActivityScreen(),
    ),
  ];

  List<int> childWeight = List.generate(6, (index) => index);
  List<String> ageListText = [
    '1 Month',
    '4 Month',
    '8 Month',
    '1 Year',
    '1.5 Year',
    '2 Year',
  ];
  UserModel? userModel;
  Future<void> getUserData() async {
    if (uId.isNotEmpty) {
      // emit(GetUserDataLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        userModel = UserModel.fromJason(value.data());
        // emit(GetUserDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        // emit(GetUserDataErrorState());
      });
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer(BuildContext context) {
    scaffoldKey.currentState!.openDrawer();
    emit(OpenDrawerState());
  }
}
