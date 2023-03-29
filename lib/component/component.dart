import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/models/account_type_model.dart';
import 'package:sizer/sizer.dart';

import '../utiels/navigation_Services.dart';

Widget floatingButton({required BuildContext context,required Function fct}) {
  Size size=MediaQuery.of(context).size;
  return GestureDetector(
    onTap:(){fct();} ,
    child: Container(
      height: size.height*0.15,
      width: size.width*0.15,
      decoration: BoxDecoration(shape: BoxShape.circle, color: darkMainColor),
      child: Icon(Icons.arrow_forward,color: whiteColor,),
      // onPressed: () {},
      // backgroundColor: Colors.cyanAccent,
    ),
  );
}
Widget accountType({required BuildContext context,required AccountTypeModel model}){
  Size size=MediaQuery.of(context).size;
  return Padding(
    padding:  EdgeInsetsDirectional.only(start: size.width*0.03),
    child: Column(
      children: [
        Container(
          height: size.height*0.25,
          width: size.width*.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),color: lightMainColor),
          child: Column(
            children: [
              Expanded(child: Image.asset(model.image,height: size.height*0.22)),
              Text(model.name,style: Theme.of(context).textTheme.headline2,)
            ],
          ),
        ),
        Checkbox(value: model.isTabbed, onChanged: (onChanged){},
          activeColor: whiteColor,
          //checkColor: whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),)
      ],
    ),
  );
}
navigateForward(Widget page, {arguments}) {
  NavigationService.navigate().navigateToScreen(page, arguments: arguments);

}
navigateForwardReplace(Widget page, {arguments}) {
  NavigationService.navigate().replaceScreen(page, arguments: arguments);

}
navigateForwardPop(Widget page, {arguments}) {
  NavigationService.navigate().goBack(page);

}
