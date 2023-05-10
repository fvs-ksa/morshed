import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translation/locale_keys.g.dart';
import 'info_profile_component.dart';



headerAuthScreen({required BuildContext context,required String title}){
  Size screenSize=MediaQuery.of(context).size;
  return SafeArea(child: Container(
    padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04),
    height: screenSize.height*0.15,
    child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            backButtonWidget(context: context),
            SizedBox(height: screenSize.height*0.03,),
            Text(title,style: Theme.of(context).textTheme.displayLarge,),
          ],
        ),
        Image.asset('assets/images/مرشد.png',height: screenSize.height * 0.2,
          width: screenSize.width * 0.3,),
      ],
    ),
  ));
}