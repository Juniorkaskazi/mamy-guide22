import 'package:flutter/material.dart';

class FeverScreen extends StatelessWidget {
  const FeverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFFA0A0)),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                child: const Text(
                  'Fever',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                children: const [
                  Image(
                    image: AssetImage(
                        'assets/images/fever_background_child_pic.png'),
                  ),
                  Text(
                    '1.Having a bacterial or viral infection.\n2.Take vaccination doses.\n3. Teething.\n4.Colds and ear infections.',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF204D66),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Treatment',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF204D66),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '1.',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF204D66),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage('assets/images/fever_child_pic.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'You can give your child an oral rehydration solution (ORS) every three to four hours during the day.\n2. Breastfeeding.\n3. Changing the type of formula milk to lactose-free milk.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF204D66),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
