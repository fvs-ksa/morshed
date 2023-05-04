import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../translation/locale_keys.g.dart';
import 'component.dart';
import '../constant/const_color.dart';
import 'info_profile_component.dart';

Widget myReportsContainerWidget(
    {required BuildContext context,
    required String reportStatus,
    required String reportId,
    Widget? solutionWidget,
    TextStyle? style,
    required String backgroundImage}) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsetsDirectional.symmetric(
        vertical: screenSize.height * 0.02,
        horizontal: screenSize.width * 0.02),
    // padding: EdgeInsetsDirectional.only(start:screenSize.width * 0.04 ),
    height: screenSize.height * 0.2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        color: whiteColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenSize.width * 0.04, top: screenSize.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'بلاغ رقم : #${reportId}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'ملاحظات البلاغ عن الشخص التائه يمكنك تقديم البلاغ بسهوله',
                style: Theme.of(context).textTheme.headline5,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: solutionWidget,
              )
            ],
          ),
        ),
        const Spacer(),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(end: screenSize.width * 0.04),
              height: screenSize.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(screenSize.width * 0.04),
                      bottomLeft: Radius.circular(screenSize.width * 0.04)),
                  image: DecorationImage(
                      image: AssetImage(backgroundImage), fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: screenSize.width * 0.06),
              child: Text(
                reportStatus,
                style: style ?? Theme.of(context).textTheme.button,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

locationWidget({required BuildContext context}) {
  Size screenSize = MediaQuery.of(context).size;
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: textFormField(
              labelText:LocaleKeys.reportLocation.tr(),
           //  hintText: 'hintText',
              context: context,
              isEnabled: false,
            ),
          ),
          SizedBox(
            width: screenSize.width * 0.06,
          ),
          decorationContainerWidget(
              context: context,
              radius: 20.sp,
              width: screenSize.width * 0.14,
              height: screenSize.height * 0.06,
              child: SvgPicture.asset('assets/svg/loc.svg')),
        ],
      ),
      TextButton(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.changeLocation.tr(),
            style: TextStyle(
                color: darkMainColor, decoration: TextDecoration.underline),
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: () {},
      ),
    ],
  );
}
