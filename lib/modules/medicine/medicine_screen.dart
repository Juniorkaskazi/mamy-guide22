import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({Key? key}) : super(key: key);

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
            'Medications List',
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/okii1.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Oplex-antitussive-5ml-twice aday',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262A53),
                      ),
                    ),
                    const Text(
                      'for 1 week',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF707070),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              '1st',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/shield.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Divider(
                color: Color(0xFF707070),
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/BrufenSyrup.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ibuprofen-anti sneezing\n-5ml-once aday',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262A53),
                      ),
                    ),
                    const Text(
                      'for 1 week',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF707070),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              '1st',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/shield.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Divider(
                color: Color(0xFF707070),
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/Lifeworth.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Omega3-vitamin-3 \ndrops-3 times aday',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF262A53),
                      ),
                    ),
                    const Text(
                      'for 1 week',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF707070),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              '1st',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/shield.png'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: const [
                            Text(
                              '2nd',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/shield.png'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: const [
                            Text(
                              '3rd',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image(
                              image: AssetImage('assets/images/shield1.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
