import 'package:flutter/material.dart';

class SleepingScreen extends StatelessWidget {
  const SleepingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0XFFFFE3E3),
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Color(0XFF262A53),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Color(0XFFFFA0A0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0XFFFFE3E3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                          'assets/images/sleeping_child_pic.png'),
                      width: MediaQuery.of(context).size.width / 1.25,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        'babies of 1:4 m must sleep 15 : 20 h a day',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                builtItem(
                  context: context,
                  text: 'from 9,10 pm to 6,7 am',
                  details:
                      'Through it, he may wake and take\n2-4 feeding doses',
                ),
                builtItem(
                  context: context,
                  text: 'from 9-10 am to 12-1 pm',
                  details: 'It must be after his 4th feeding dose',
                ),
                builtItem(
                  context: context,
                  text: 'from 4-5 pm to 7-8 pm',
                  enableDetails: false,
                ),
                builtItem(
                  context: context,
                  text: 'from 4-5 pm to 7-8 pm',
                  enableDivider: false,
                  enableDetails: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Image(
                image: const AssetImage('assets/images/half-moon.png'),
                height: MediaQuery.of(context).size.height / 14.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget builtItem({
    required BuildContext context,
    required String text,
    String details = '',
    bool enableDivider = true,
    bool enableDetails = true,
  }) =>
      Row(
        children: [
          Column(
            children: [
              const Image(
                image: AssetImage('assets/images/timer.png'),
                // height: MediaQuery.of(context).size.height / 12.0,
              ),
              if (enableDivider)
                Container(
                  padding: const EdgeInsets.only(top: 2.0),
                  height: MediaQuery.of(context).size.height / 15.0,
                  child: const VerticalDivider(
                    color: Colors.white,
                    thickness: 1.2,
                    width: 10.0,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.white.withOpacity(0.2),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 15.0,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFFFFE3E3),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (enableDetails)
                const SizedBox(
                  height: 5,
                ),
              if (enableDetails)
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070),
                  ),
                ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      );
}
