import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class VaccinesScreen extends StatelessWidget {
  const VaccinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/vaccines.png'),
              fit: BoxFit.fill,
            )),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30.0,
              right: MediaQuery.of(context).size.width / 25,
              left: MediaQuery.of(context).size.width / 25,
              bottom: MediaQuery.of(context).size.height / 9.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 5.0),
                  child: const Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                      'Vaccines',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFFFFE3E3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50.0,
                ),
                Image(
                  image: const AssetImage(
                    'assets/images/vaccines_child_pic.png',
                  ),
                  height: MediaQuery.of(context).size.width / 2,
                  alignment: AlignmentDirectional.centerEnd,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                  child: const Text(
                    'Your baby from 1:4 month vaccines are:',
                    style: TextStyle(
                      color: Color(0xFFFFE3E3),
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color(0xFF262A53).withOpacity(0.8),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 30.0,
                      vertical: MediaQuery.of(context).size.height / 80.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AppCubit.get(context)
                          .vaccinesSentences
                          .map(
                            (e) => Text(
                              e,
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          .toList(),
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
}
