import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/doctor_model.dart';
import 'package:mamy_guide/models/message_model.dart';
import 'package:mamy_guide/models/parent_model.dart';
import 'package:mamy_guide/modules/common_diseases/drought_screen.dart';
import 'package:mamy_guide/modules/common_diseases/fever_screen.dart';
import 'package:mamy_guide/modules/common_diseases/stomach_cramps_screen.dart';
import 'package:mamy_guide/modules/growth/weight_chart_data.dart';
import 'package:mamy_guide/shared/components/constants.dart';

import '../models/home_model.dart';
import '../modules/activity/activity_screen.dart';
import '../modules/chat_with_doctor/chat_with_doctor_screen.dart';
import '../modules/common_diseases/common_diseases_screen.dart';
import '../modules/growth/baby_weight_details_screen.dart';
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
      nextPage: const BabyWeightDetailsScreen(),
    ),
    HomeModel(
      image: 'assets/images/VaccinationsList.png',
      name: 'Vaccinations List',
      nextPage: VaccinationsListScreen(),
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
      nextPage: ActivityScreen(),
    ),
  ];

  List<HomeModel> commonDiseasesModel = [
    HomeModel(
      image: 's',
      name: 'Stomach Cramps',
      nextPage: const StomachCrampsScreen(),
    ),
    HomeModel(
      image: 'dr',
      name: 'Drought',
      nextPage: const DroughtScreen(),
    ),
    HomeModel(
      image: 'fe',
      name: 'Fever',
      nextPage: const FeverScreen(),
    ),
    HomeModel(
      image: 'vs',
      name: 'Constipation',
      nextPage: const Scaffold(),
    ),
    HomeModel(
      image: '3',
      name: 'Conjunctivities',
      nextPage: const Scaffold(),
    ),
    HomeModel(
      image: '635',
      name: 'Juandice',
      nextPage: const Scaffold(),
    ),
    HomeModel(
      image: '51',
      name: 'Umbilical Hernia',
      nextPage: const Scaffold(),
    ),
  ];

  List<int> childWeights = List.generate(6, (index) => index);
  List<int> childHeights = List.generate(6, (index) => index);
  List<double> normalWeight = [
    3.2,
    7.5,
    8.8,
    10,
    11,
    12,
  ];
  List<double> normalHeight = [
    50,
    65,
    71,
    75.5,
    80,
    85.5,
  ];
  List<String> ageListText = [
    '1 Month',
    '4 Month',
    '8 Month',
    '1 Year',
    '1.5 Year',
    '2 Year',
  ];

  List<WeightChartData> weightChartData = [];
  List<NormalWeightChartData> normalWeightChartData = [];
  List<HeightChartData> heightChartData = [];
  List<NormalHeightChartData> normalHeightChartData = [];
  List<String> vaccinesSentences = [
    '-Hepatitis B (HepB) (1st dose)',
    '-Hepatitis B (HepB)  (2nd dose)',
    '-Diphtheria, tetanus, and whooping cough (pertussis) (DTaP) (1st dose)',
    '-Haemophilus influenzae type b disease (Hib) (1st dose)',
    '-Polio (IPV)  (1st dose)',
    '-Pneumococcal disease (PCV13) (1st dose)',
    '-Rotavirus (RV)  (1st dose)',
    '-Diphtheria, tetanus, and whooping cough (pertussis) (DTaP) (2nd dose)',
    '-Haemophilus influenzae type b disease (Hib) (2nd dose)',
    '-Polio (IPV) (2nd dose)',
    '-Pneumococcal disease (PCV13) (2nd dose)',
    '-Rotavirus (RV) (2nd dose)',
  ];

  ParentModel? parentModel;
  DoctorModel? doctorModel;

  Future<void> getUserData() async {
    if (uId.isNotEmpty) {
      if (userType == parentKey) {
        return FirebaseFirestore.instance
            .collection('parents')
            .doc(uId)
            .get()
            .then((value) {
          parentModel = ParentModel.fromJason(value.data());
        }).catchError((error) {
          print(error.toString());
        });
      } else if (userType == doctorKey) {
        return FirebaseFirestore.instance
            .collection('doctors')
            .doc(uId)
            .get()
            .then((value) {
          doctorModel = DoctorModel.fromJason(value.data());
        }).catchError((error) {
          print(error.toString());
        });
      }
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<DoctorModel> doctorsList = [];
  List<ParentModel> parentList = [];

  void getAllDoctors() async {
    emit(GetAllDoctorsLoadingState());
    doctorsList = [];
    await FirebaseFirestore.instance.collection('doctors').get().then((value) {
      for (var element in value.docs) {
        doctorsList.add(DoctorModel.fromJason(element.data()));
      }
      emit(GetAllDoctorsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllDoctorsErrorState());
    });
  }

  void getAllParents() async {
    emit(GetAllParentsLoadingState());
    parentList = [];
    await FirebaseFirestore.instance.collection('parents').get().then((value) {
      for (var element in value.docs) {
        parentList.add(ParentModel.fromJason(element.data()));
      }
      emit(GetAllParentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllParentsErrorState());
    });
  }

  void openDrawer(BuildContext context) {
    scaffoldKey.currentState!.openDrawer();
    emit(OpenDrawerState());
  }

  void fillWeightChartData() {
    for (int i = 0; i < ageListText.length; i++) {
      weightChartData.add(WeightChartData(ageListText[i], childWeights[i]));
      normalWeightChartData
          .add(NormalWeightChartData(ageListText[i], normalWeight[i]));
      print(i);
    }
  }

  void fillHeightChartData() {
    for (int i = 0; i < ageListText.length; i++) {
      heightChartData.add(HeightChartData(ageListText[i], childHeights[i]));
      normalHeightChartData
          .add(NormalHeightChartData(ageListText[i], normalHeight[i]));
      print(i);
    }
  }

  var messageController = TextEditingController();
  //send message
  void sendMessage({
    required String message,
    required String receiverId,
  }) async {
    if (messageController.text.isNotEmpty) {
      emit(SendMessagesLoadingState());
      MessageModel messageModel = MessageModel(
          sender: uId,
          receiver: receiverId,
          message: message,
          date: DateTime.now().toString());
      if (userType == parentKey) {
        await FirebaseFirestore.instance
            .collection('parents')
            .doc(uId)
            .collection('chats')
            .doc(receiverId)
            .collection('messages')
            .add(messageModel.toJson())
            .then((value) {
          emit(SendMessagesSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(SendMessagesErrorState());
        });

        await FirebaseFirestore.instance
            .collection('doctors')
            .doc(receiverId)
            .collection('chats')
            .doc(uId)
            .collection('messages')
            .add(messageModel.toJson())
            .then((value) {
          emit(SendMessagesSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(SendMessagesErrorState());
        });
      } else {
        await FirebaseFirestore.instance
            .collection('doctors')
            .doc(uId)
            .collection('chats')
            .doc(receiverId)
            .collection('messages')
            .add(messageModel.toJson())
            .then((value) {
          emit(SendMessagesSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(SendMessagesErrorState());
        });

        await FirebaseFirestore.instance
            .collection('parents')
            .doc(receiverId)
            .collection('chats')
            .doc(uId)
            .collection('messages')
            .add(messageModel.toJson())
            .then((value) {
          emit(SendMessagesSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(SendMessagesErrorState());
        });
      }
    }
  }

  //get messages
  Stream<QuerySnapshot<Map<String, dynamic>>>? getMessages({
    required String receiverId,
  }) {
    if (userType == parentKey) {
      return FirebaseFirestore.instance
          .collection('parents')
          .doc(uId)
          .collection('chats')
          .doc(receiverId)
          .collection('messages')
          .orderBy('date')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('doctors')
          .doc(uId)
          .collection('chats')
          .doc(receiverId)
          .collection('messages')
          .orderBy('date')
          .snapshots();
    }
  }
}
