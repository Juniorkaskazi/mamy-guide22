import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/modules/growth/height_chart.dart';
import 'package:mamy_guide/modules/growth/weight_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeightChartScreen extends StatelessWidget {
  const WeightChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).fillWeightChartData();
    AppCubit.get(context).checkWeight();
    print(AppCubit.get(context).weightChartData);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
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
                      builder: (_) => const HeightChartScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              )
            ],
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/STATISTICAL_CURVE_background.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Statistical curve with normal growth range and the actual growth range of baby',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  '(Weight)',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF628395),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<NormalWeightChartData, String>(
                      dataSource: AppCubit.get(context).normalWeightChartData,
                      xValueMapper: (NormalWeightChartData data, _) =>
                          data.month,
                      yValueMapper: (NormalWeightChartData data, _) =>
                          data.weight,
                      name: 'Normal',
                      xAxisName: 'Month',
                      yAxisName: 'Weight',
                      legendIconType: LegendIconType.circle,
                      legendItemText: 'Normal',
                      color: const Color(0xFF262A53),
                      isVisibleInLegend: true,
                    ),
                    ColumnSeries<WeightChartData, String>(
                      dataSource: AppCubit.get(context).weightChartData,
                      xValueMapper: (WeightChartData data, _) => data.month,
                      yValueMapper: (WeightChartData data, _) => data.weight,
                      name: 'Actual',
                      xAxisName: 'Month',
                      yAxisName: 'Weight',
                      legendIconType: LegendIconType.circle,
                      legendItemText: 'Actual',
                      color: const Color(0xFF628395),
                      isVisibleInLegend: true,
                    ),
                  ],
                  legend: Legend(
                    isVisible: true,
                    alignment: ChartAlignment.center,
                    position: LegendPosition.bottom,
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                if (!AppCubit.get(context).isNormalWeightGrowth)
                  const Text(
                    'Your baby has wrong in carve, please contact to doctor!',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
