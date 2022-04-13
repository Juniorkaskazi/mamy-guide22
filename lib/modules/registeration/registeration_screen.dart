import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mamy_guide/modules/registeration/cubit/registration_cubit.dart';

import '../../layouts/home_layout.dart';
import '../../shared/components/components.dart';
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
                    Row(
                      children: const [
                        Text(
                          'Parent info ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFffa0a0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFffa0a0),
                            thickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Name',
                      prefixIcon: Icons.person,
                      type: TextInputType.name,
                      controller: RegistrationCubit.get(context).nameController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Email',
                      prefixIcon: Icons.email,
                      type: TextInputType.emailAddress,
                      controller:
                          RegistrationCubit.get(context).emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Password',
                      prefixIcon: Icons.password,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      controller:
                          RegistrationCubit.get(context).passwordController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Phone Number',
                      prefixIcon: Icons.phone,
                      type: TextInputType.phone,
                      controller:
                          RegistrationCubit.get(context).phoneNumberController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Baby info ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFffa0a0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFffa0a0),
                            thickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Baby Name',
                      prefixIcon: Icons.person,
                      type: TextInputType.name,
                      controller:
                          RegistrationCubit.get(context).babyNameController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Birthday',
                      prefixIcon: Icons.date_range,
                      type: TextInputType.datetime,
                      isReadOnly: true,
                      controller:
                          RegistrationCubit.get(context).birthDayController,
                      onTap: () {
                        RegistrationCubit.get(context)
                            .choseBirthDayDate(context: context);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Gender',
                      prefixIcon: Icons.male,
                      type: TextInputType.text,
                      controller:
                          RegistrationCubit.get(context).genderController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Address',
                      prefixIcon: Icons.home,
                      type: TextInputType.streetAddress,
                      controller:
                          RegistrationCubit.get(context).addressController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Blood Type',
                      prefixIcon: Icons.bloodtype,
                      type: TextInputType.text,
                      controller:
                          RegistrationCubit.get(context).bloodTypeController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: state is! AddNewUserLoadingState &&
                              state is! CreateNewUserLoadingState
                          ? MaterialButton(
                              onPressed: () {
                                RegistrationCubit.get(context)
                                    .addNewUser()
                                    .then((value) {
                                  // Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => HomeLayout(),
                                  //   ),
                                  //   (route) => false,
                                  // );
                                });
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFFFFA0A0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: const Color(0xFF628395),
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, RegistrationStates state) {
          if (state is CreateNewUserSuccessState) {
            Fluttertoast.showToast(msg: 'Register Successfully');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomeLayout(),
              ),
              (route) => false,
            );
          }
          if (state is AddNewUserErrorState) {
            Fluttertoast.showToast(msg: 'Register Error!!');
          }
        },
      ),
    );
  }
}
