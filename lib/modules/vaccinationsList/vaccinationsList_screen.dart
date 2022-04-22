import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';

class VaccinationsListScreen extends StatelessWidget {
  const VaccinationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    checkBoxItem(context: context, text: 'Birth', value: true),
                    checkBoxItem(
                        context: context, text: '1-2 month', value: true),
                    checkBoxItem(
                        context: context, text: '6-18 month', value: false),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'DTaP'),
                    checkBoxItem(context: context, text: '2th', value: true),
                    checkBoxItem(context: context, text: '4th', value: true),
                    checkBoxItem(context: context, text: '6th', value: true),
                    checkBoxItem(
                        context: context, text: '15-18 month', value: false),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'Hib'),
                    checkBoxItem(context: context, text: '2th', value: true),
                    checkBoxItem(context: context, text: '4th', value: true),
                    checkBoxItem(context: context, text: '6th', value: true),
                    checkBoxItem(
                        context: context, text: '12-15 month', value: false),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'IPV'),
                    checkBoxItem(context: context, text: '2th', value: true),
                    checkBoxItem(context: context, text: '4th', value: true),
                    checkBoxItem(
                        context: context, text: '6-18 month', value: false),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'PCV'),
                    checkBoxItem(context: context, text: '2th', value: true),
                    checkBoxItem(context: context, text: '4th', value: true),
                    checkBoxItem(context: context, text: '6th', value: true),
                    checkBoxItem(
                        context: context, text: '12-15 month', value: false),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'RV'),
                    checkBoxItem(context: context, text: '2th', value: true),
                    checkBoxItem(context: context, text: '4th', value: true),
                    checkBoxItem(context: context, text: '6th', value: true),
                  ],
                ),
                defaultHorizontalSizedBox(),
                Row(
                  children: [
                    nameItem(context, 'FLU'),
                    checkBoxItem(
                      context: context,
                      text: 'Every flu season after 6th',
                      value: false,
                      width: MediaQuery.of(context).size.width / 2,
                      fontSize: 13,
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
                      value: false,
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
                      value: false,
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
                      value: false,
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
    Function(bool?)? onChanged,
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
                onChanged!(v);
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
