import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/components/text_style.dart';

Widget titleText({String title})=> Container(
  child: Text(
    title,
    style: titleTextStyle(),
  ),
);