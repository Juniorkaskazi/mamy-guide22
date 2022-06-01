import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);

  List<ActivityList> list = [
    ActivityList(
        image: 'baby-boy',
        percentage: '69',
        title: 'Pull exercise',
        color: 0xFFFEDD5B),
    ActivityList(
      image: 'leg (2)',
      percentage: '78',
      title: 'Wheel exercise',
      color: 0xFFFF914D,
    ),
    ActivityList(
        image: 'arm (1)',
        percentage: '83',
        title: 'Arm exercise',
        color: 0xFF7360B9),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white.withOpacity(0.4),
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: const Text(
            'Activity List',
            style: TextStyle(
              color: Color(0xFF262A53),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE3E3),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF262A53),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFFFE3E3),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your babies daily work is almost done',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.0475,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF262A53),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Image(
                      image: AssetImage('assets/images/activity_rating.png')),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white.withOpacity(0.4),
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: const Text(
                      '35% more to finish it !',
                      style: TextStyle(
                        color: Color(0xFF262A53),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      for (var i = 0; i < list.length; i++)
                        Row(
                          children: [
                            activityListCard(
                              context: context,
                              image: list[i].image.toString(),
                              percentage: list[i].percentage.toString(),
                              title: list[i].title.toString(),
                              color: list[i].color!.toInt(),
                            ),
                            if (i != list.length - 1) const SizedBox(width: 7),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Activity',
                      style: TextStyle(
                        color: Color(0xFF262A53),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Image(
                    image: AssetImage(
                      'assets/images/activity_chart.png',
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget activityListCard({
    required BuildContext context,
    required String image,
    required String percentage,
    required String title,
    required int color,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(color).withOpacity(0.3),
              border: Border.all(
                color: Colors.black12,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(color),
                  ),
                  child: Image(
                    image: AssetImage('assets/images/$image.png'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    color: Color(0xFF262A53),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class ActivityList {
  String? image;
  String? percentage;
  String? title;
  int? color;

  ActivityList({
    required this.image,
    required this.percentage,
    required this.title,
    required this.color,
  });
}
