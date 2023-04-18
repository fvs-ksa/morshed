import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'const_color.dart';

Widget decorationContainerWidget(
    {required BuildContext context, required Widget child}) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    height: screenSize.height * 0.05,
    width: screenSize.width * 0.2,
    child: Center(child: child),
    decoration: BoxDecoration(
        color: babyBlueColor, borderRadius: BorderRadius.circular(35.sp)),
  );
}

Widget backButtonWidget({required Function fct}) {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    elevation: 3,
    child: InkWell(
        onTap: () {
          fct();
        },
        child: CircleAvatar(
          backgroundColor: whiteColor,
          child: SvgPicture.asset('assets/svg/dropdown-1.svg'),
        )),
  );
}

