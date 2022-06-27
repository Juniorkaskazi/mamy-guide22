import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/modules/registeration/cubit/registration_cubit.dart';
import 'package:mamy_guide/modules/registeration/cubit/registration_states.dart';

import '../../shared/components/components.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: const [
                Text(
                  'Doctor info ',
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
              controller: RegistrationCubit.get(context).doctorNameController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultTextFormField(
              hint: 'Email',
              prefixIcon: Icons.email,
              type: TextInputType.emailAddress,
              controller: RegistrationCubit.get(context).doctorEmailController,
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
                  RegistrationCubit.get(context).doctorPasswordController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultTextFormField(
              hint: 'Phone Number',
              prefixIcon: Icons.phone,
              type: TextInputType.phone,
              controller:
                  RegistrationCubit.get(context).doctorPhoneNumberController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultTextFormField(
              hint: 'Years of Experience',
              prefixIcon: Icons.date_range,
              type: TextInputType.number,
              controller: RegistrationCubit.get(context)
                  .doctorYearsOfExperienceController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultTextFormField(
              hint: 'Specialty',
              prefixIcon: Icons.person,
              type: TextInputType.text,
              controller:
                  RegistrationCubit.get(context).doctorSpecialtyController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: state is! AddNewParentLoadingState &&
                      state is! CreateNewParentLoadingState
                  ? MaterialButton(
                      onPressed: () {
                        RegistrationCubit.get(context).addNewDoctor();
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
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFFA0A0),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
