import 'package:flutter/material.dart';

import '../models/home_model.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  List<HomeModel> homeModel = [
    HomeModel(image: 'assets/images/Growth.png', name: 'Growth', onTap: () {}),
    HomeModel(
        image: 'assets/images/VaccinationsList.png',
        name: 'Vaccinations List',
        onTap: () {
          print('Vaccinations');
        }),
    HomeModel(
        image: 'assets/images/Places.png',
        name: 'Nearest Hospitals',
        onTap: () {}),
    HomeModel(
        image: 'assets/images/SectionsOfAge.png',
        name: 'Sections Of Age',
        onTap: () {}),
    HomeModel(
        image: 'assets/images/ChatWithDoctor.png',
        name: 'Chat With Doctor',
        onTap: () {}),
    HomeModel(
        image: 'assets/images/CommonDiseases.png',
        name: 'Common Diseases',
        onTap: () {}),
    HomeModel(
        image: 'assets/images/Medicatin.png', name: 'Medicatin', onTap: () {}),
    HomeModel(
        image: 'assets/images/Activity.png', name: 'Activity', onTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: InkWell(
          onTap: () {
            drawerController.;
          },
          child: Image(
            image: AssetImage(
              'assets/images/drawer.png',
            ),
          ),
        ),*/
        elevation: 0.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          itemBuilder: (BuildContext context, int index) {
            return itemBuilder(
              name: homeModel[index].name.toString(),
              image: homeModel[index].image.toString(),
              onTap: homeModel[index].onTap,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 20.0),
          itemCount: homeModel.length),
    );
  }
}

Widget itemBuilder({
  required String name,
  required String image,
  required Function onTap,
}) =>
    InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Card(
          color: const Color(0xFFffe3e3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image.toString()),
                  height: 70.0,
                ),
                const Spacer(),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF262a53),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
