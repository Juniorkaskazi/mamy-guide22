import 'package:flutter/cupertino.dart';

class HomeModel {
  String? name;
  String? image;
  Widget nextPage;

  HomeModel({this.name, this.image, required this.nextPage});
}
