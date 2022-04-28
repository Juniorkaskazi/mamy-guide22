import 'package:flutter/material.dart';
import 'package:mamy_guide/cubit/cubit.dart';

class CommonDiseasesScreen extends StatelessWidget {
  const CommonDiseasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFFFFA0A0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          image: const DecorationImage(
            image: AssetImage('assets/images/Common Diseases.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border:
                      Border.all(color: const Color(0xFF707070), width: 1.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Text(
                      'Common Diseases'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Image(
                      image: const AssetImage('assets/images/5.png'),
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildCommonDiseasesItem(
                      context: context,
                      title: AppCubit.get(context)
                          .commonDiseasesModel[index]
                          .name
                          .toString(),
                      image: AppCubit.get(context)
                          .commonDiseasesModel[index]
                          .image
                          .toString(),
                      nextScreen: AppCubit.get(context)
                          .commonDiseasesModel[index]
                          .nextPage,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20.0),
                  itemCount: AppCubit.get(context).commonDiseasesModel.length),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                    ),
                    onPressed: () {},
                    color: const Color(0xFFFFA0A0),
                    child: Text(
                      'Add Disease',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCommonDiseasesItem({
    required BuildContext context,
    required String title,
    required String image,
    required Widget nextScreen,
  }) =>
      Container(
        height: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
          color: const Color(0xFFFFA0A0),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: const Color(0xFF707070), width: 1.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: const Color(0xFF707070), width: 1.0),
              ),
              child: Image(
                image: AssetImage('assets/images/$image.png'),
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF335775),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nextScreen,
                  ),
                );
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xFF335775),
                size: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ],
        ),
      );
}
