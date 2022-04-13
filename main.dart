import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/layouts/home_layout.dart';
import 'package:mamy_guide/modules/login/login_screen.dart';
import 'package:mamy_guide/modules/start_screen/start_screen.dart';
import 'package:mamy_guide/shared/BlocObserver.dart';
import 'package:mamy_guide/shared/components/constants.dart';
import 'package:mamy_guide/shared/network/local/cashed_helper.dart';
import 'package:mamy_guide/shared/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      await Firebase.initializeApp();
      await CashedHelper.init();
      startOpend = CashedHelper.getData(key: isStartKey) ?? false;
      uId = CashedHelper.getData(key: uIdKey) ?? '';
      Widget startScreen = const StartScreen();
      if (startOpend) {
        if (uId.isEmpty) {
          startScreen = const LoginScreen();
        } else {
          startScreen = HomeLayout();
        }
      } else {
        startScreen = const StartScreen();
      }
      runApp(MyApp(
        startScreen: startScreen,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.startScreen}) : super(key: key);
  Widget startScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AppCubit();
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: const Color(0xFF262A53),
              primarySwatch: primarySwatchColor,
            ),
            debugShowCheckedModeBanner: false,
            home: startScreen,
          );
        },
      ),
    );
  }
}
