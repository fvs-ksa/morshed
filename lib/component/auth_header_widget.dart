import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../translation/locale_keys.g.dart';
import 'info_profile_component.dart';



headerAuthScreen({required BuildContext context,required String title}){
  Size screenSize=MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize:Size.fromHeight(
        150.h) ,
    child: SafeArea(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04),
        height: 150.h,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                backButtonWidget(context: context),
                SizedBox(height: 20.h,),
                Text(title,style: Theme.of(context).textTheme.displayLarge,),
              ],
            ),
            whiteMorshedLogo(image: 'assets/images/مرشد.png')
            // Image.asset('assets/images/مرشد.png',height: 93.h,
            //   width: 152.w,),
          ],
        ),
      ),
    ),
  );
}
whiteMorshedLogo({required String image,double? width,double? height}){
  return Image.asset(image,height:height??94.h ,width:width?? 154.w,);
}