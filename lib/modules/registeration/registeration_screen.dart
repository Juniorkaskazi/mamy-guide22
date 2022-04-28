import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:mamy_guide/modules/registeration/cubit/registration_cubit.dart';
import 'package:mamy_guide/modules/registeration/doctor_screen.dart';
import 'package:mamy_guide/modules/registeration/parent_screen.dart';
import 'package:mamy_guide/user_type_enum.dart';

import '../../layouts/home_layout.dart';
import 'cubit/registration_states.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return RegistrationCubit();
      },
      child: BlocConsumer<RegistrationCubit, RegistrationStates>(
        builder: (BuildContext context, RegistrationStates state) {
          return Scaffold(
            backgroundColor: const Color(0xFF262a53),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RadioGroup<UserType>.builder(
                      groupValue:
                          RegistrationCubit.get(context).typeOfUserValue,
                      onChanged: (UserType? value) {
                        RegistrationCubit.get(context).changeTypeOfUser(value!);
                      },
                      items: RegistrationCubit.get(context).typeOfUser,
                      itemBuilder: (item) => RadioButtonBuilder(item.name),
                      textStyle: const TextStyle(
                        color:
                            Color.fromRGBO(255, 160, 160, 0.9176470588235294),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      activeColor: const Color.fromRGBO(
                        255,
                        160,
                        160,
                        0.9176470588235294,
                      ),
                      horizontalAlignment: MainAxisAlignment.center,
                      direction: Axis.horizontal,
                    ),
                    RegistrationCubit.get(context).typeOfUserValue ==
                            UserType.Parent
                        ? const ParentScreen()
                        : const DoctorScreen(),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, RegistrationStates state) {
          if (state is CreateNewParentSuccessState ||
              state is CreateNewDoctorSuccessState) {
            Fluttertoast.showToast(msg: 'Register Successfully');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeLayout(),
              ),
              (route) => false,
            );
          }
          if (state is AddNewParentErrorState ||
              state is AddNewDoctorErrorState) {
            Fluttertoast.showToast(msg: 'Register Error!!');
          }
        },
      ),
    );
  }
}
