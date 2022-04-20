import 'package:flutter/material.dart';
import 'package:mamy_guide/modules/sections_of_age/routine_1_to_2_years.dart';
import 'package:mamy_guide/modules/sections_of_age/routine_1_to_4.dart';
import 'package:mamy_guide/modules/sections_of_age/routine_5_to_8.dart';
import 'package:mamy_guide/modules/sections_of_age/routine_9_to_12.dart';

import '../../models/section_of_ages_model.dart';
import '../../shared/components/components.dart';

class SectionsOfAgeScreen extends StatelessWidget {
  SectionsOfAgeScreen({Key? key}) : super(key: key);

  List<SectionOfAgesModel> list = [
    SectionOfAgesModel(
        "Routine 1:4 months", "assets/images/baby1.png", Routine1To4Screen()),
    SectionOfAgesModel(
        "Routine 5:8 months", "assets/images/baby2.png", Routine5To8Screen()),
    SectionOfAgesModel(
        "Routine 9:12 months", "assets/images/baby3.png", Routine9To12Screen()),
    SectionOfAgesModel("Routine 1:2 years", "assets/images/baby4.png",
        Routine1To2YearsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return sectionOfAgeListItem(context, index, list);
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 15.0,
        ),
      ),
    );
  }
}
