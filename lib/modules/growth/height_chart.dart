import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/modules/growth/weight_chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeightChartScreen extends StatelessWidget {
  const HeightChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).fillHeightChartData();
    AppCubit.get(context).checkHeight();
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
                  '(Height)',
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
                    ColumnSeries<NormalHeightChartData, String>(
                      dataSource: AppCubit.get(context).normalHeightChartData,
                      xValueMapper: (NormalHeightChartData data, _) =>
                          data.month,
                      yValueMapper: (NormalHeightChartData data, _) =>
                          data.height,
                      name: 'Normal',
                      xAxisName: 'Month',
                      yAxisName: 'Height',
                      legendIconType: LegendIconType.circle,
                      legendItemText: 'Normal',
                      color: const Color(0xFF262A53),
                      isVisibleInLegend: true,
                    ),
                    ColumnSeries<HeightChartData, String>(
                      dataSource: AppCubit.get(context).heightChartData,
                      xValueMapper: (HeightChartData data, _) => data.month,
                      yValueMapper: (HeightChartData data, _) => data.height,
                      name: 'Actual',
                      xAxisName: 'Month',
                      yAxisName: 'Height',
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
                if (!AppCubit.get(context).isNormalHeightGrowth)
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
