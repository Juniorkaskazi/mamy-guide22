import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/modules/chat_with_doctor/chat_with_parent_screen.dart';
import 'package:mamy_guide/shared/components/components.dart';

import '../../cubit/states.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).openDrawer(context);
                },
                icon: const Image(
                  image: AssetImage(
                    'assets/images/drawer.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: homeScreenItemBuilder(
                  context: context,
                  name: 'Chat with parents',
                  image: 'assets/images/ChatWithDoctor.png',
                  nextPage: ChatWithParentScreen(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
