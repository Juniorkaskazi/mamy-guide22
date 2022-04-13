import 'package:flutter/material.dart';
import 'package:mamy_guide/shared/components/constants.dart';
import 'package:mamy_guide/shared/network/local/cashed_helper.dart';

import '../login/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/welcome_background.png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 8.0,
            right: MediaQuery.of(context).size.width / 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {
                  CashedHelper.putData(key: isStartKey, value: true);
                  isStart = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Start',
                  style: TextStyle(
                    color: Color(0xFFFFA0A0),
                  ),
                ),
                color: const Color(0xFF262A53),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
