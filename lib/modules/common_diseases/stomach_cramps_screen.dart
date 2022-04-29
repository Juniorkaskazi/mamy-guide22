import 'package:flutter/material.dart';

class StomachCrampsScreen extends StatelessWidget {
  const StomachCrampsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFFA0A0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF707070),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFA0A0),
                border: Border.all(
                  color: const Color(0xFF707070),
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: const Text(
                'Stomach Cramps',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Causes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF204D66),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                const Image(
                  image: AssetImage(
                      'assets/images/stomach_cramps_background_pic.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '1.colic\n2.constipation\n3.gastroenteritis\n4.gas blockage',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF204D66),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Treatment',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF204D66),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1.Wrap your baby in a warm towel to ease  tummy pains.\n2.giving a warm bath.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF204D66),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image(
                        image: AssetImage(
                            'assets/images/stomach_cramps__pic.png')),
                    SizedBox(height: 10),
                    Text(
                      '3.A teaspoon of Tummy calm if needed.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF204D66),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
