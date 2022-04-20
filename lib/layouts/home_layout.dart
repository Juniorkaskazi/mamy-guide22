import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/shared/network/local/cashed_helper.dart';

import '../modules/login/login_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          key: AppCubit.get(context).scaffoldKey,
          drawer: Drawer(
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
                        const Image(
                          image: AssetImage('assets/images/child_pic.png'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          AppCubit.get(context).userModel!.babyName.toString(),
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
                        const SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () {
                            CashedHelper.removeData(key: uIdKey);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => LoginScreen(),
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
          ),
          body: FutureBuilder(
            future: AppCubit.get(context).getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        itemBuilder: (BuildContext context, int index) {
                          return itemBuilder(
                            context: context,
                            name: AppCubit.get(context)
                                .homeModel[index]
                                .name
                                .toString(),
                            image: AppCubit.get(context)
                                .homeModel[index]
                                .image
                                .toString(),
                            nextPage:
                                AppCubit.get(context).homeModel[index].nextPage,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 20.0),
                        itemCount: AppCubit.get(context).homeModel.length,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Widget itemBuilder({
  required BuildContext context,
  required String name,
  required String image,
  required Widget nextPage,
}) =>
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => nextPage,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Card(
          color: const Color(0xFFffe3e3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image.toString()),
                  height: 70.0,
                ),
                const Spacer(),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF262a53),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
