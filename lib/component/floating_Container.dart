
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget floatingContainer({required AlignmentDirectional alignment,required BuildContext context,required String svgAssets,required String title,required double width,required Color color}){
  Size size = MediaQuery.of(context).size;
  return  Align(
    alignment: alignment,
    child: Container(
      padding: EdgeInsetsDirectional.only(start: size.width*0.06,end: size.width*0.02),
      height: size.height * 0.07,
      width: width,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(25.sp),color: color),
      child: Row(
        children: [
          SvgPicture.asset(svgAssets),
          SizedBox(width: size.width*0.02,),
          Expanded(child: Text(title,style: Theme.of(context).textTheme.labelLarge,))
        ],),
    ),
  );
}