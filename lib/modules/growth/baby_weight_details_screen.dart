import 'package:flutter/material.dart';
import 'package:mamy_guide/cubit/cubit.dart';

import '../../shared/components/components.dart';
import 'baby_height_details_screen.dart';

class BabyWeightDetailsScreen extends StatelessWidget {
  const BabyWeightDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE3E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE3E3),
        elevation: 0.0,
        title: const Text('Baby Weight Details'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BabyHeightDetailsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/STATISTICAL_CURVE_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 40.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildDetailsListItem(
              context: context,
              index: index,
              text: AppCubit.get(context).ageListText[index],
              initial: 5,
              min: 1,
              max: 20,
              onValueChanged: (num) {
                AppCubit.get(context).childWeights[index] = num.toInt();
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 50.0,
          ),
          itemCount: AppCubit.get(context).ageListText.length,
        ),
      ),
    );
  }
}
