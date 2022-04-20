import 'package:flutter/material.dart';

import '../../models/section_of_ages_model.dart';

Widget defaultTextFormField({
  Color backgroundColor = const Color(0xFFFFA0A0),
  required String hint,
  bool isPassword = false,
  IconData? suffixIcon,
  required IconData prefixIcon,
  required TextInputType type,
  Function? onTap,
  bool isReadOnly = false,
  TextEditingController? controller,
}) =>
    Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        onTap: () {
          onTap != null ? onTap() : () {};
        },
        controller: controller,
        autofocus: false,
        readOnly: isReadOnly,
        keyboardType: type,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          // contentPadding: const EdgeInsets.only(bottom: 8.0),
          suffixIcon: Icon(suffixIcon),
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: const Color(0xFF204d66),
          suffixIconColor: const Color(0xFF204d66),
        ),
        cursorColor: const Color(0xFF262A53),
      ),
    );

Widget sectionOfAgeListItem(
        BuildContext context, int index, List<SectionOfAgesModel> list) =>
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => list[index].nextScreen,
          ),
        );
      },
      child: Container(
        height: 250,
        width: 400,
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.grey.shade200,
          elevation: 17,
          color: const Color(0XFFFFA0A0),
          child: Column(
            children: [
              Image(
                image: AssetImage(list[index].url),
                fit: BoxFit.fill,
                height: 180,
                width: 400,
              ),
              const Spacer(),
              Text(
                list[index].id,
                style: const TextStyle(
                  color: Colors.white,
                  decorationThickness: 2,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
