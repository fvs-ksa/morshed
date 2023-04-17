import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'const_color.dart';
import 'info_profile_component.dart';

Widget circleAvtarWidget({required String svgImage,}){
  return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: CircleAvatar(
          backgroundColor: whiteColor,
          child: SvgPicture.asset(
              svgImage)));
}
PreferredSize preferredHeaderWithGuide({required BuildContext context,required String title,required Widget rowWidget}){
  Size screenSize=MediaQuery.of(context).size;
  return PreferredSize(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        child: Container(
          padding: EdgeInsetsDirectional.only(
              top: screenSize.height * 0.07,
              start: screenSize.width * 0.03,
              end: screenSize.width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  backButtonWidget(fct: () {
                    Navigator.pop(context);
                  }),
                  SizedBox(
                    width: screenSize.width * 0.25,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              rowWidget
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(screenSize.height * 0.22));
}