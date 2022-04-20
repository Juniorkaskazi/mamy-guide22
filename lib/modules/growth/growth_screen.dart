import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/modules/growth/weight_chart.dart';

class GrowthScreen extends StatelessWidget {
  const GrowthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE3E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE3E3),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WeightChartScreen(),
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
          itemBuilder: (BuildContext context, int index) {
            return buildWeightListItem(
              context: context,
              index: index,
              text: AppCubit.get(context).ageListText[index],
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

  Widget buildWeightListItem({
    required BuildContext context,
    required int index,
    required String text,
  }) =>
      Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const Spacer(),
          Counter(
            min: 1,
            max: 20,
            initial: 5,
            step: 1,
            onValueChanged: (num) {
              AppCubit.get(context).childWeight[index] = num.toInt();
            },
            configuration: DefaultConfiguration(),
          ),
        ],
      );
}
