import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget floatingContainer({required AlignmentDirectional alignment,
  required Function fct,
  required BuildContext context,required String svgAssets,
  required String title,
required double width,
  required Color color}){
  return  GestureDetector(
    onTap: (){fct();},
    child: Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 20.w,end: 10.w),
        height: 64.h,
        width: width,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(25.sp),color: color),
        child: Row(
          children: [
            SvgPicture.asset(svgAssets),
            SizedBox(width: 10.w,),
             FittedBox(child: Text(title,style: Theme.of(context).textTheme.labelLarge,))
          ],),
      ),
    ),
  );
}
