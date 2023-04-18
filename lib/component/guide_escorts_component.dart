import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'component.dart';
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
PreferredSize preferredHeaderWithGuide({required BuildContext context,bool isActive=true,required String title, TextEditingController? searchController, Function? fct}){
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
             isActive? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: textFormField(
                        controller: searchController,
                          labelText: 'بحث بالأسم أو رقم الجوال',
                          hintText: 'بحث بالأسم أو رقم الجوال',
                          context: context)),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: screenSize.height * 0.01),
                      child: mainButton(
                          width: screenSize.width * 0.2,
                          height: screenSize.height * 0.06,
                          text: 'بحث',
                          color: darkMainColor,
                          context: context,
                          fct: () {fct!();}))
                ],
              ):const SizedBox()
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(isActive?screenSize.height * 0.22:screenSize.height*0.15));
}
Widget itemContainerOfGuidesAndEscorts({required BuildContext context,Widget? contactColumn,required String image,required String name,required String phone}){
  Size screenSize=MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsetsDirectional.only(
        bottom: screenSize.height * 0.01),
    padding:
    EdgeInsetsDirectional.only(end: screenSize.width * 0.02),
    height: screenSize.height * 0.15,
    decoration: BoxDecoration(
        color: whiteColor,
        borderRadius:
        BorderRadius.circular(screenSize.width * 0.04)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              name,
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: RichText(
              text: TextSpan(
                  text: 'رقم الجوال : ',
                  style: Theme.of(context).textTheme.caption,
                  children: [
                    TextSpan(
                        text: phone,
                        style:
                        Theme.of(context).textTheme.headline5)
                  ]),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: darkMainColor,
              child: Image.asset(image,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        contactColumn??const SizedBox()
      ],
    ),
  );
}