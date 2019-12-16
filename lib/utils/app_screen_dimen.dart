import 'package:flutter/material.dart';

//get device screen width
getScreenWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

//get device screen height
getScreenHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}
