import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:mamy_guide/modules/login/cubit/login_cubit.dart';
import 'package:mamy_guide/modules/login/cubit/login_states.dart';
import 'package:mamy_guide/shared/components/constants.dart';

import '../../layouts/home_layout.dart';
import '../../shared/components/components.dart';
import '../../user_type_enum.dart';
import '../registeration/registeration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {
          if (state is LoginParentSuccessState) {
            print(userType);
            if (userType == parentKey) {
              Fluttertoast.showToast(msg: 'Login Successfully');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeLayout(),
                ),
                (route) => false,
              );
            }
          }
          if (state is LoginDoctorSuccessState) {
            if (userType == doctorKey) {
              Fluttertoast.showToast(msg: 'Login Successfully');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeLayout(),
                ),
                (route) => false,
              );
            }
          }

          if (state is LoginUserErrorState) {
            Fluttertoast.showToast(
                msg: 'Login error!!\ncheck your email and password');
          }

          if (state is LoginParentErrorState ||
              state is LoginDoctorErrorState) {
            Fluttertoast.showToast(msg: 'Check user type and try again');
          }
        },
        builder: (BuildContext context, LoginStates state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF628395),
              elevation: 0.0,
            ),
            // resizeToAvoidBottomInset: false,
            body: Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_background.png',
                  ),
                  fit: BoxFit.fill,
                ),
                color: Color(0xFF628395),
              ),
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4.5,
                      ),
                      child: const Text(
                        'Welcome',
                        style: TextStyle(
                            color: Color(0xFFFFA0A0),
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'User Name',
                      prefixIcon: Icons.person,
                      type: TextInputType.name,
                      controller: LoginCubit.get(context).emailLoginController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25.0,
                    ),
                    defaultTextFormField(
                      hint: 'Password',
                      prefixIcon: Icons.password,
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                      controller:
                          LoginCubit.get(context).passwordLoginController,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Do you forget password?',
                          style: TextStyle(
                              color: Color(0xFFFFA0A0),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 3.0),
                        ),
                      ),
                    ),
                    RadioGroup<UserType>.builder(
                      groupValue: LoginCubit.get(context).typeOfUserValue,
                      onChanged: (UserType? value) {
                        LoginCubit.get(context).changeTypeOfUser(value!);
                      },
                      items: LoginCubit.get(context).typeOfUser,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 16.0,
                      child: state is! LoginUserLoadingState
                          ? MaterialButton(
                              onPressed: () {
                                LoginCubit.get(context).loginUser();
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 28.0,
                                  color: Color(0xFFFFA0A0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: const Color(0xFF628395),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFFFA0A0),
                              ),
                            ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create new account',
                        style: TextStyle(
                            color: Color(0xFFFFA0A0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
