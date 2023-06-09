import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  return Container(
    margin: EdgeInsetsDirectional.symmetric(vertical: 5.h, horizontal: 5.w),
    height: 173.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp), color: whiteColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w, top: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'بلاغ رقم : #$reportId',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'ملاحظات البلاغ عن الشخص التائه يمكنك\n تقديم البلاغ بسهوله',
                style: GoogleFonts.cairo(
                    fontSize: 12.spMax,
                    color: blackColor,
                    fontWeight: FontWeight.normal),
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
              padding: EdgeInsetsDirectional.only(end: 15.w),
              height: 45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(15.sp)),
                  image: DecorationImage(
                      image: AssetImage(backgroundImage), fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 20.w),
              child: Text(
                reportStatus,
                style: style ?? Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

locationWidget({required BuildContext context}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: textFormField(
              labelText: LocaleKeys.reportLocation.tr(),
              //  hintText: 'hintText',
              context: context,
              isEnabled: false,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          decorationContainerWidget(
              context: context,
              radius: 20.sp,
              width: 54.w,
              height: 54.h,
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
