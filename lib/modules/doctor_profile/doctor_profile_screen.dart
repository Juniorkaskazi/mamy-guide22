import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/doctor_model.dart';
import 'package:mamy_guide/modules/chat_with_doctor/chat_screen.dart';
import 'package:mamy_guide/shared/components/constants.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({Key? key, required this.doctor}) : super(key: key);
  DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFE3E3),
          appBar: AppBar(
            backgroundColor: const Color(0xFFFFE3E3),
            elevation: 0.0,
            leading: IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                color: Theme.of(context).primaryColor,
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Image(
                    image: const AssetImage(
                        'assets/images/doctor_profile_pic.png'),
                    height: MediaQuery.of(context).size.height * 0.33,
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Dr. ${doctor.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/newborn.png'),
                      height: 30.0,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      doctor.specialty.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/team.png'),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            '200+',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/briefcase.png'),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            '${doctor.yearsOfExperience} years',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const Image(
                                image: AssetImage('assets/images/star.png'),
                                height: 25.0,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/star-1.png'),
                                      height: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/star-2.png'),
                                      height: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            '${doctor.rate!.roundToDouble()}',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Available Time',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    timesItem(
                      context: context,
                      day: 'Sunday',
                    ),
                    const SizedBox(width: 15.0),
                    timesItem(
                      context: context,
                      day: 'Tuesday',
                    ),
                    const SizedBox(width: 15.0),
                    timesItem(
                      context: context,
                      day: 'Thursday',
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (uId != doctor.uId)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                doctor: doctor,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Ask for help',
                          style: TextStyle(
                            color: Color(0xFFFFE3E3),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget timesItem({
    required BuildContext context,
    required String day,
  }) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white.withOpacity(0.25),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                Image(
                  image: const AssetImage('assets/images/daytime.png'),
                  color: Theme.of(context).primaryColor,
                  height: 15.0,
                ),
                const SizedBox(width: 10.0),
                Image(
                  image: const AssetImage('assets/images/cloudy-day.png'),
                  color: Theme.of(context).primaryColor,
                  height: 15.0,
                ),
                const SizedBox(width: 10.0),
                Image(
                  image: const AssetImage('assets/images/half-moon.png'),
                  color: Theme.of(context).primaryColor,
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      );
}
