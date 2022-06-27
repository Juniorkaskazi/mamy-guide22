import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/layouts/home_layout.dart';
import 'package:mamy_guide/models/doctor_model.dart';
import 'package:mamy_guide/models/parent_model.dart';
import 'package:mamy_guide/modules/doctor_profile/doctor_profile_screen.dart';
import 'package:mamy_guide/modules/parent_profile/parent_profile_screen.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

import '../../shared/components/constants.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key, this.doctor, this.parent}) : super(key: key);
  DoctorModel? doctor;
  ParentModel? parent;

  var listController = ScrollController();

  void jumpToBottom() {
    listController.jumpTo(
      listController.position.maxScrollExtent + 2,
    );
  }

  void jumpToTop() {
    listController.jumpTo(
      listController.position.minScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showRatingDialog(
          context: context,
        );
        return false;
      },
      child: StreamBuilder<QuerySnapshot>(
        stream: userType == parentKey
            ? AppCubit.get(context)
                .getMessages(receiverId: doctor!.uId.toString())
            : AppCubit.get(context)
                .getMessages(receiverId: parent!.uId.toString()),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is SendMessagesSuccessState) {
                jumpToBottom();
                AppCubit.get(context).messageController.clear();
              }
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                appBar: AppBar(
                  title: const Text('Messages'),
                  leading: IconButton(
                    color: const Color(0xFFFFE3E3),
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      showRatingDialog(context: context);
                    },
                  ),
                  actions: [
                    //to bottom
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        jumpToBottom();
                      },
                    ),
                    //to top
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up_rounded),
                      onPressed: () {
                        jumpToTop();
                      },
                    ),
                  ],
                  titleTextStyle: const TextStyle(
                    color: Color(0xFFFFE3E3),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arlrdbd',
                  ),
                  elevation: 0.0,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE3E3),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Image(
                                  image: AssetImage(
                                    userType == parentKey
                                        ? 'assets/images/doctor.png'
                                        : 'assets/images/child_pic.png',
                                  ),
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2.0, right: 2.0),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.green.shade300,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        if (userType == doctorKey) {
                                          return ParentProfileScreen(
                                            parent: parent as ParentModel,
                                          );
                                        } else {
                                          return DoctorProfileScreen(
                                            doctor: doctor as DoctorModel,
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  userType == parentKey
                                      ? doctor!.name.toString()
                                      : parent!.name.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.video_call,
                                  size: 20,
                                ),
                                color: const Color(0xFFFFE3E3),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 18,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.call,
                                  size: 18,
                                ),
                                color: const Color(0xFFFFE3E3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: Conditional.single(
                            context: context,
                            conditionBuilder: (context) =>
                                snapshot.hasData &&
                                snapshot.data!.docs.isNotEmpty,
                            widgetBuilder: (context) {
                              if (snapshot.data!.docs.isNotEmpty) {
                                return ListView.separated(
                                    controller: listController,
                                    itemBuilder: (context, index) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        jumpToBottom();
                                      }
                                      if (snapshot.data!.docs[index]
                                              ['sender'] ==
                                          uId) {
                                        return _buildSenderMessage(
                                            context: context,
                                            message: snapshot.data!.docs[index]
                                                ['message']);
                                      } else {
                                        return _buildReceiverMessage(
                                            context: context,
                                            message: snapshot.data!.docs[index]
                                                ['message']);
                                      }
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                    itemCount: snapshot.data!.docs.length);
                              } else {
                                return Center(
                                  child: Text(
                                    'No messages yet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          color: const Color(0xFFFFA0A0),
                                        ),
                                  ),
                                );
                              }
                            },
                            fallbackBuilder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Color(0xFFFFE3E3),
                              ));
                            }),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE3E3),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onTap: () {
                                        jumpToBottom();
                                      },
                                      controller: AppCubit.get(context)
                                          .messageController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type...',
                                        contentPadding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.emoji_emotions_outlined,
                                      size: 25,
                                    ),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xFFFFE3E3),
                            child: IconButton(
                              onPressed: () {
                                AppCubit.get(context).sendMessage(
                                  message: AppCubit.get(context)
                                      .messageController
                                      .text,
                                  receiverId: userType == parentKey
                                      ? doctor!.uId.toString()
                                      : parent!.uId.toString(),
                                );
                              },
                              icon: const Icon(
                                Icons.send,
                                size: 25,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xFFFFE3E3),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                size: 25,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void showRatingDialog({
    required BuildContext context,
    // required DoctorModel doctorModel,
  }) {
    if (doctor != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(
                'Rate ${doctor!.name}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: const Color(0xFFFFA0A0),
                    ),
              ),
              backgroundColor: const Color(0xFF262A53),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SimpleStarRating(
                    allowHalfRating: false,
                    isReadOnly: false,
                    filledIcon: const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    nonFilledIcon: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 20,
                    ),
                    size: 25,
                    rating: 5,
                    spacing: 5,
                    onRated: (rating) {
                      print(rating);
                      AppCubit.get(context).doctorRate = rating!;
                    },
                    starCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    AppCubit.get(context).makeDoctorRate(doctor as DoctorModel);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomeLayout()),
                        (route) => false);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Color(0xFFFFE3E3),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          });
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeLayout()), (route) => false);
    }
  }

  @override
  Widget _buildSenderMessage(
          {required BuildContext context, required String message}) =>
      Align(
        alignment: Alignment.topLeft,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300.0),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    // top: Radius.circular(50.0),
                    bottom: Radius.circular(5.0),
                  ),
                  color: Color(0xFFFFE3E3),
                ),
                margin: const EdgeInsets.only(
                  left: 15.0,
                ),
                height: 40.0,
                width: 30.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFFFFE3E3),
              ),
              margin: const EdgeInsets.only(
                bottom: 20.0,
              ),
              padding: const EdgeInsets.all(18.0),
              child: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  Widget _buildReceiverMessage(
          {required BuildContext context, required String message}) =>
      Align(
        alignment: Alignment.topRight,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300.0),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5.0),
                  ),
                  color: Color(0xFFFFA0A0),
                ),
                margin: const EdgeInsets.only(
                  right: 15.0,
                ),
                height: 40.0,
                width: 30.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFFFFA0A0),
              ),
              margin: const EdgeInsets.only(
                bottom: 20.0,
              ),
              padding: const EdgeInsets.all(18.0),
              child: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
