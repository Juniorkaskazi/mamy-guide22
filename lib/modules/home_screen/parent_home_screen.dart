import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/shared/components/components.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

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
                    return homeScreenItemBuilder(
                      context: context,
                      name: AppCubit.get(context)
                          .homeModel[index]
                          .name
                          .toString(),
                      image: AppCubit.get(context)
                          .homeModel[index]
                          .image
                          .toString(),
                      nextPage: AppCubit.get(context).homeModel[index].nextPage,
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
    );
  }
}
