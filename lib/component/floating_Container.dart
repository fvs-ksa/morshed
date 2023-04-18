import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'const_color.dart';

Widget floatingContainer({required BuildContext context,required String svgAssets,required String title,required double width,required Color color}){
  Size size = MediaQuery.of(context).size;
  return  Align(
    alignment: AlignmentDirectional.bottomStart,
    child: Container(
      padding: EdgeInsetsDirectional.only(start: size.width*0.06),
      height: size.height * 0.07,
      width: width,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(25.sp),color: color),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgAssets),
          SizedBox(width: size.width*0.02,),
          Text(title,style: Theme.of(context).textTheme.button,)
        ],),
    ),
  );
}