import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/const_color.dart';

void showToast({required String text, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseColor(state),
        textColor: Colors.white,
        fontSize: 16.0.sp);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.WARNING:
      color = orangeColor;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

Widget richText(
    {required Function navigation,
    required String text,
    required String tappedText,
    required BuildContext context}) {
  return Text.rich(TextSpan(
      text: text,
      style: Theme.of(context).textTheme.titleSmall,
      children: [
        TextSpan(
            text: tappedText,
            style: TextStyle(
                fontSize: 17.sp,
                color: darkMainColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                navigation();
              })
      ]));
}
