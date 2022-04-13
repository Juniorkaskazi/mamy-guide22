import 'package:flutter/material.dart';

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
