import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/layouts/home_layout.dart';
import 'package:mamy_guide/shared/components/components.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Email',
                      prefixIcon: Icons.email,
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Password',
                      prefixIcon: Icons.password,
                      type: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Phone Number',
                      prefixIcon: Icons.phone,
                      type: TextInputType.phone,
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Birthday',
                      prefixIcon: Icons.date_range,
                      type: TextInputType.datetime,
                      isReadOnly: true,
                      controller: AppCubit.get(context).birthDayController,
                      onTap: () {
                        AppCubit.get(context)
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Address',
                      prefixIcon: Icons.home,
                      type: TextInputType.streetAddress,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      hint: 'Blood Type',
                      prefixIcon: Icons.bloodtype,
                      type: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeLayout(),
                            ),
                            (route) => false,
                          );
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {});
  }
}
