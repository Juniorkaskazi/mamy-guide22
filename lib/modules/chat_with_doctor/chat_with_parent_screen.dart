import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/parent_model.dart';
import 'package:mamy_guide/modules/chat_with_doctor/chat_screen.dart';

class ChatWithParentScreen extends StatelessWidget {
  const ChatWithParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getAllParents();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Parents',
              style: TextStyle(color: Color(0xFFFFE3E3)),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>
                  states is! GetAllParentsLoadingState,
              widgetBuilder: (BuildContext context) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return buildParentListItem(
                        context: context,
                        parent: AppCubit.get(context).parentList[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: AppCubit.get(context).parentList.length,
                );
              },
              fallbackBuilder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFA0A0),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildParentListItem({
    required BuildContext context,
    required ParentModel parent,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatScreen(
              parent: parent,
            );
          }));
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/child_pic.png'),
            ),
            const SizedBox(width: 10),
            Text(
              parent.name.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFE3E3),
              ),
            ),
          ],
        ),
      );
}
