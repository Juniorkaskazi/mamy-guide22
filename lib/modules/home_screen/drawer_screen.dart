import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/doctor_model.dart';
import 'package:mamy_guide/models/parent_model.dart';
import 'package:mamy_guide/modules/doctor_profile/doctor_profile_screen.dart';
import 'package:mamy_guide/modules/parent_profile/parent_profile_screen.dart';
import 'package:mamy_guide/shared/components/constants.dart';

import '../../cubit/cubit.dart';
import '../../shared/network/local/cashed_helper.dart';
import '../login/login_screen.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(
                        image: userType == parentKey
                            ? const AssetImage('assets/images/child_pic.png')
                            : const AssetImage('assets/images/doctor.png'),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        userType == parentKey
                            ? AppCubit.get(context)
                                .parentModel!
                                .babyName
                                .toString()
                            : AppCubit.get(context)
                                .doctorModel!
                                .name
                                .toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFE3E3),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                if (userType == parentKey) {
                                  return ParentProfileScreen(
                                      parent: AppCubit.get(context).parentModel
                                          as ParentModel);
                                }
                                return DoctorProfileScreen(
                                    doctor: AppCubit.get(context).doctorModel
                                        as DoctorModel);
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_outline,
                              color: Color(0xFFFFA0A0),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'My Profile',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFFFFA0A0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      if (userType == parentKey)
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Color(0xFFFFA0A0),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'Add baby',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFFFFA0A0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (userType == parentKey)
                        const SizedBox(
                          height: 20.0,
                        ),
                      InkWell(
                        onTap: () {
                          uId = '';
                          userType = '';
                          CashedHelper.removeData(key: uIdKey);
                          CashedHelper.removeData(key: userTypeKey);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Color(0xFFFFA0A0),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFFFFA0A0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
