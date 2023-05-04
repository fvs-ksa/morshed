import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'component.dart';
import '../constant/const_color.dart';

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
headerInfoPerson({required BuildContext context,bool isProfile=false,required String title,bool isHeaderProfile=true,required Widget avatarChild}){
  Size screenSize = MediaQuery.of(context).size;
  return PreferredSize(
      child: Stack(
        children: [
          Container(
            height: screenSize.height * 0.2,
            child: Padding(
              padding:  EdgeInsetsDirectional.only(end: !isProfile?screenSize.width*0.04:0,bottom:!isProfile?screenSize.height*0.02:0 ),
              child: Align(alignment: isProfile?AlignmentDirectional.center:AlignmentDirectional.bottomEnd,child: Text(title,style: Theme.of(context).textTheme.headline2,)),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(top: screenSize.width*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                backButtonWidget(fct: (){Navigator.pop(context);}),
                SizedBox(height: screenSize.height*0.03,),
                isHeaderProfile?  Padding(
                  padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.03,),
                  child: CircleAvatar(backgroundColor: darkMainColor,child: avatarChild,
                    radius: screenSize.height*0.05,
                  ),
                ):SizedBox()
              ],
            ),
          )
        ],
      ),
      preferredSize: Size.fromHeight(screenSize.height * 0.25));
}

