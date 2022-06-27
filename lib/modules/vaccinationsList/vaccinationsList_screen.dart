import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';

class VaccinationsListScreen extends StatelessWidget {
  const VaccinationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hebBBirthValue = true;
    bool _hebB1to2Month = true;
    bool _hebB6to18Month = false;

    bool _dt2th = true;
    bool _dt4th = true;
    bool _dt6th = true;
    bool _dt15to18Month = false;

    bool _hib2th = true;
    bool _hib4th = true;
    bool _hib6th = true;
    bool _hib12to18Month = false;

    bool _ipv2th = true;
    bool _ipv4th = true;
    bool _ipv6to18Month = false;

    bool _pcv2th = true;
    bool _pcv4th = true;
    bool _pcv6th = true;
    bool _pcv12to15Month = false;

    bool _rv2th = true;
    bool _rv4th = true;
    bool _rv6th = true;

    bool _fluValue = false;
    bool _hepAValue = false;
    bool _mmrValue = false;
    bool _varicellaValue = false;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Row(
                children: [
                  Image(
                    image: const AssetImage(
                        'assets/images/VaccinationListTitle.png'),
                    width: MediaQuery.of(context).size.width / 7.0,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Vaccination List',
                      style: TextStyle(color: Color(0XFFFFE3E3))),
                ],
              ),
              backgroundColor: const Color(0XFF262A53),
              elevation: 0.0,
              iconTheme: const IconThemeData(
                color: Color(0XFFFFE3E3),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
          backgroundColor: const Color(0XFFFFE3E3),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    nameItem(context, 'Hep B'),
                    checkBoxItem(
                      context: context,
                      text: 'Birth',
                      value: _hebBBirthValue,
                      onChanged: (value) {
                        _hebBBirthValue = value;
                      },
                    ),
                    checkBoxItem(
                        context: context,
                        text: '1-2 month',
                        value: _hebB1to2Month,
                        onChanged: (value) {
                          _hebB1to2Month = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6-18 month',
                        value: _hebB6to18Month,
                        onChanged: (value) {
                          _hebB6to18Month = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'DTaP'),
                    checkBoxItem(
                        context: context,
                        text: '2th',
                        value: _dt2th,
                        onChanged: (value) {
                          _dt2th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '4th',
                        value: _dt4th,
                        onChanged: (value) {
                          _dt4th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6th',
                        value: _dt6th,
                        onChanged: (value) {
                          _dt6th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '15-18 month',
                        value: _dt15to18Month,
                        onChanged: (value) {
                          _dt15to18Month = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'Hib'),
                    checkBoxItem(
                        context: context,
                        text: '2th',
                        value: _hib2th,
                        onChanged: (value) {
                          _hib2th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '4th',
                        value: _hib4th,
                        onChanged: (value) {
                          _hib4th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6th',
                        value: _hib6th,
                        onChanged: (value) {
                          _hib6th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '12-15 month',
                        value: _hib12to18Month,
                        onChanged: (value) {
                          _hib12to18Month = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'IPV'),
                    checkBoxItem(
                        context: context,
                        text: '2th',
                        value: _ipv2th,
                        onChanged: (value) {
                          _ipv2th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '4th',
                        value: _ipv4th,
                        onChanged: (value) {
                          _ipv4th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6-18 month',
                        value: _ipv6to18Month,
                        onChanged: (value) {
                          _ipv6to18Month = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'PCV'),
                    checkBoxItem(
                        context: context,
                        text: '2th',
                        value: _pcv2th,
                        onChanged: (value) {
                          _pcv2th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '4th',
                        value: _pcv4th,
                        onChanged: (value) {
                          _pcv4th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6th',
                        value: _pcv6th,
                        onChanged: (value) {
                          _pcv6th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '12-15 month',
                        value: _pcv12to15Month,
                        onChanged: (value) {
                          _pcv12to15Month = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'RV'),
                    checkBoxItem(
                        context: context,
                        text: '2th',
                        value: _rv2th,
                        onChanged: (value) {
                          _rv2th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '4th',
                        value: _rv4th,
                        onChanged: (value) {
                          _rv4th = value;
                        }),
                    checkBoxItem(
                        context: context,
                        text: '6th',
                        value: _rv6th,
                        onChanged: (value) {
                          _rv6th = value;
                        }),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'FLU'),
                    checkBoxItem(
                      context: context,
                      text: 'Every flu season after 6th',
                      value: _fluValue,
                      width: MediaQuery.of(context).size.width / 2,
                      fontSize: 13,
                      onChanged: (value) {
                        _fluValue = value;
                      },
                    ),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'Hep A'),
                    checkBoxItem(
                      context: context,
                      text: '12-20 month',
                      value: _hepAValue,
                      onChanged: (value) {
                        _hepAValue = value;
                      },
                    ),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'MMR'),
                    checkBoxItem(
                      context: context,
                      text: '12-15 month',
                      value: _mmrValue,
                      onChanged: (value) {
                        _mmrValue = value;
                      },
                    ),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'Varicella', fontSize: 11),
                    checkBoxItem(
                      context: context,
                      text: '12-15 month',
                      value: _varicellaValue,
                      onChanged: (value) {
                        _varicellaValue = value;
                      },
                    ),
                  ],
                ),
                defaultHorizontalSizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget nameItem(
    BuildContext context,
    String name, {
    double fontSize = 16,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: const Color(0xFF628396),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFE3E3),
          ),
        ),
      );

  Widget checkBoxItem({
    required BuildContext context,
    required String text,
    required bool value,
    required Function(bool value) onChanged,
    double? width,
    double fontSize = 10.1,
  }) =>
      SizedBox(
        width: width ?? MediaQuery.of(context).size.width / 5.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (v) {
                AppCubit.get(context).changeValue();
                onChanged(v!);
              },
            ),
          ],
        ),
      );

  Widget defaultVerticalSizedBox({double space = 3}) => SizedBox(
        width: space,
      );
  Widget defaultHorizontalSizedBox({double space = 10}) => SizedBox(
        height: space,
      );
}
