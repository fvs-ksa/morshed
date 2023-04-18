import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const_color.dart';

Widget myReportsContainerWidget({required BuildContext context,required String reportStatus,required String reportId,Widget? solutionWidget,TextStyle? style,required String backgroundImage}){
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsetsDirectional.symmetric(vertical: screenSize.height*0.02,horizontal: screenSize.width*0.02),
    // padding: EdgeInsetsDirectional.only(start:screenSize.width * 0.04 ),
    height: screenSize.height * 0.19,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        color: whiteColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(
                  end: screenSize.width * 0.04),
              height: screenSize.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight:
                      Radius.circular(screenSize.width * 0.04),
                      topLeft:
                      Radius.circular(screenSize.width * 0.04)),
                  image:  DecorationImage(
                      image:
                      AssetImage(backgroundImage),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: screenSize.width * 0.06),
              child: Text(
                reportStatus,
                style:style?? Theme.of(context).textTheme.button,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start:screenSize.width * 0.04 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('بلاغ رقم : #${reportId}',style: Theme.of(context).textTheme.headline1,),
              Text('ملاحظات البلاغ عن الشخص التائه يمكنك تقديم البلاغ بسهوله',style: Theme.of(context).textTheme.headline5,),
              Align(alignment: AlignmentDirectional.bottomEnd,child: solutionWidget)
            ],
          ),
        )
      ],
    ),
  );
}