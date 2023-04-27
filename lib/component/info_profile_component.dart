import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'component.dart';
import 'const_color.dart';

Widget decorationContainerWidget(
    {required BuildContext context, required Widget child,required double radius,double? width,double? height}) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    height:height?? screenSize.height * 0.05,
    width:width?? screenSize.width * 0.2,
    child: Center(child: child),
    decoration: BoxDecoration(
        color: babyBlueColor, borderRadius: BorderRadius.circular(radius)),
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
bigTextFieldForNotes({required BuildContext context,required String hint}){
  Size screenSize=MediaQuery.of(context).size;
  return  SizedBox(
    height: screenSize.height*0.17,
    // color: Colors.red,
    child: Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.03),
          child: textFormField(labelText: hint,  context: context,lines: 5,isEnabled: false),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenSize.height*0.05),
          child: CircleAvatar(
            radius: screenSize.width*0.07,
            backgroundColor: babyBlueColor,child: SvgPicture.asset('assets/svg/file (1).svg'),),
        )
      ],
    ),
  );
}
// rowTextFieldWidget({required BuildContext context}){
//   Size screenSize=MediaQuery.of(context).size;
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Expanded(child: textFormField(labelText: 'رقم الجوال', hintText: 'hintText', context: context,keyboardType: TextInputType.number)),
//       SizedBox(width: screenSize.width*0.06,),
//       decorationContainerWidget(context: context,child:Text('+966',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,)),
//     ],
//   ),
// }

