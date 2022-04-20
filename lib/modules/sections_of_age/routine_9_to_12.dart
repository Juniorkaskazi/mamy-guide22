import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/section_of_ages_model.dart';
import '../../shared/components/components.dart';

class Routine9To12Screen extends StatelessWidget {
  Routine9To12Screen({Key? key}) : super(key: key);

  List<SectionOfAgesModel> list = [
    SectionOfAgesModel("Nutrition", "assets/images/ROUTINE1.png", Container()),
    SectionOfAgesModel("Sleeping", "assets/images/ROUTINE2.png", Container()),
    SectionOfAgesModel(
        "Vaccinations", "assets/images/ROUTINE3.png", Container()),
    SectionOfAgesModel(
        "Normal Growth Data", "assets/images/ROUTINE4.png", Container()),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 15.0,
                      shadowColor: Colors.white70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'ROUTINE',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFFFFA0A0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '9:12 months age',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFFFFA0A0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return sectionOfAgeListItem(context, index, list);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10.0,
                    ),
                    itemCount: list.length,
                  )
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {});
  }
}
