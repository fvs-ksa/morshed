import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'component.dart';
import '../constant/const_color.dart';

Widget decorationContainerWidget(
    {required BuildContext context,
    required Widget child,
    required double radius,
    double? width,
    double? height}) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    height: height ?? screenSize.height * 0.05,
    width: width ?? screenSize.width * 0.2,
    child: Center(child: child),
    decoration: BoxDecoration(
        color: babyBlueColor, borderRadius: BorderRadius.circular(radius)),
  );
}

Widget backButtonWidget(
    {required BuildContext context}) {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    elevation: 3,
    child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: whiteColor,
          child: SvgPicture.asset(context.locale.languageCode == 'en'
              ? 'assets/svg/dropdown-2en.svg'
              : 'assets/svg/dropdown-1.svg'),
        )),
  );
}

bigTextFieldForNotes({required BuildContext context, required String hint}) {
  Size screenSize = MediaQuery.of(context).size;
  return SizedBox(
    height: 165.h,
    child: Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: screenSize.height * 0.03),
          child: textFormField(
              maxHeight: 133.h,
              minHeight: 133.h,
              labelText: hint, context: context, lines: 15),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: screenSize.height * 0.05),
          child: CircleAvatar(
            radius: screenSize.width * 0.07,
            backgroundColor: babyBlueColor,
            child: SvgPicture.asset('assets/svg/imageForBigContainer.svg'),
          ),
        )
      ],
    ),
  );
}

headerInfoPerson(
    {required BuildContext context,
    bool isProfile = false,
    required String title,
    bool isHeaderProfile = true,
    required Widget avatarChild}) {
  return PreferredSize(
      child: Stack(
        children: [
          Container(
            height: 190.h,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  end: !isProfile ? 10.w : 0,
                  bottom: !isProfile ? 5.w : 0),
              child: Align(
                  alignment: isProfile
                      ? AlignmentDirectional.center
                      : AlignmentDirectional.bottomEnd,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/header1.png'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                backButtonWidget(
                    context: context),
                SizedBox(
                  height:20.h,
                ),
                isHeaderProfile
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 15.w,
                        ),
                        child: CircleAvatar(
                          backgroundColor: darkMainColor,
                          child: avatarChild,
                          radius: 40.sp,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
      preferredSize: Size.fromHeight(220.h));
}
