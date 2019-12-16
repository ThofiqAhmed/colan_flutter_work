import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_style.dart';

Row buildSmallCaption(String caption, BuildContext context) {
  return Row(
    children: <Widget>[
      Text(
        caption,
        style: getStyleCaption(context).copyWith(color: Colors.black87),
      ),
      Text(
        "*",
        style: getStyleCaption(context).copyWith(color: colorPrimary),
      )
    ],
  );
}
