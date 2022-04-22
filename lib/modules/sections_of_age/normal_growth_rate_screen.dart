import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';

class NormalGrowthRateScreen extends StatelessWidget {
  const NormalGrowthRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFE3E3),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/normal_growth_rate.png'),
              fit: BoxFit.fill,
            )),
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50.0,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Image(
                    image: const AssetImage(
                      'assets/images/normal_growth_child_pic.png',
                    ),
                    height: MediaQuery.of(context).size.height / 4.5,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Image(
                  image: const AssetImage(
                    'assets/images/normal_growth_weight_rate.png',
                  ),
                  height: MediaQuery.of(context).size.height / 7.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25.0,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
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
                    '4:8 m babies must be 6:8 kg & 50:75 cm',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/images/scale.png',
                          ),
                          height: MediaQuery.of(context).size.height / 12.0,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Color(0xFF707070),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Your baby must reach 6kg per his 4th month after that, his weight increases by 500g every month to reach 8kg per his 8th.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/images/ruler.png',
                          ),
                          height: MediaQuery.of(context).size.height / 12.0,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Color(0xFF707070),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Your baby must reach 50cm per his 4th month after that, his height increases by 6.3cm every month to reach 75cm per his 8th.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        // maxLines: 3,
                        // minFontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 120,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image(
                    image: const AssetImage(
                      'assets/images/newborn.png',
                    ),
                    height: MediaQuery.of(context).size.height / 12.0,
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
