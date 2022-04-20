import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE3E3),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: const Color(0xFFFFE3E3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/nutrition_child.png'),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(45.0),
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.15),
                  width: 2,
                ),
                left: BorderSide(
                  color: Colors.black.withOpacity(0.15),
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.black.withOpacity(0.15),
                  width: 2,
                ),
                top: BorderSide(
                  color: Colors.black.withOpacity(0.15),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              'For the first 1 to 4 months,\nbreast milk or formula\nis the only food your baby needs',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFA0A0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Spacer(),
                          Image(
                            image: AssetImage('assets/images/sippy_cup.png'),
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage('assets/images/milk.png'),
                          ),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Baby should be fed every two hours\n10th breast milk and twice formula\nas breast feeding is important and\nhelp in process of growth .',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFFFFE3E3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
