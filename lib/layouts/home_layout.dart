import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/modules/home_screen/drawer_screen.dart';
import 'package:mamy_guide/modules/home_screen/parent_home_screen.dart';

import '../modules/home_screen/doctor_home_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return FutureBuilder(
          future: AppCubit.get(context).getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (AppCubit.get(context).parentModel == null &&
                userType == parentKey) {
              return Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffffa0a0),
                  ),
                ),
              );
            } else if ((AppCubit.get(context).doctorModel == null &&
                    userType == doctorKey) ||
                (AppCubit.get(context).parentModel == null &&
                    userType == parentKey)) {
              return Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffffa0a0),
                  ),
                ),
              );
            } else {
              return Scaffold(
                key: AppCubit.get(context).scaffoldKey,
                drawer: const DrawerPage(),
                body: userType == parentKey
                    ? const ParentHomeScreen()
                    : const DoctorHomeScreen(),
              );
            }
          },
        );
      },
    );
  }
}
