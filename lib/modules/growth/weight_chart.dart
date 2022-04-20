import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeightChartScreen extends StatelessWidget {
  const WeightChartScreen({Key? key}) : super(key: key);

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
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/STATISTICAL_CURVE_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Statistical curve with normal growth range and the actual growth range of baby(Weight)',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SfCartesianChart(
              // primaryXAxis: (),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              // series: ChartSeries<List<String>, List<int>>(
              //   xValueMapper: (AppCubit.get(context).childWeight, _)
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
