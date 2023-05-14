import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';

import '../../../constant/const_color.dart';
import '../../../component/guide_escorts_component.dart';
import '../../../translation/locale_keys.g.dart';

class MyReportsDetailsScreen extends StatelessWidget {
  int index;

  MyReportsDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerOfTechnicalSupport(context: context, title: LocaleKeys.reportDetails.tr()),
      body: GestureDetector(
        onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 62.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(index == 0
                                ? 'assets/images/Group 204366.png'
                                : index == 1
                                    ? 'assets/images/Group 204365.png'
                                    : 'assets/images/Group 204367.png'),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    index == 0
                        ? LocaleKeys.underProcessing.tr()
                        : index == 1
                            ?LocaleKeys.guideOnTheWay.tr()
                            :LocaleKeys.Resolved.tr() ,
                    style: index == 2
                        ? Theme.of(context).textTheme.bodyLarge
                        : Theme.of(context).textTheme.labelLarge,
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w
                    ,vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    textFormField(labelText:LocaleKeys.reportNumber.tr(),  context: context,isEnabled: false),
                    textFormField(labelText:LocaleKeys.passportNo.tr() ,  context: context,isEnabled: false),
                    textFormField(labelText:LocaleKeys.reportLocation.tr(),  context: context,isEnabled: false),
                    bigTextFieldForNotes(

                        context: context, hint:LocaleKeys.commentsAndAssistance.tr() ),
                    Text(LocaleKeys.WhatCanWeDoToAssistYou.tr(),style: Theme.of(context).textTheme.displayLarge,),
                    SizedBox(height:5.h,),
                    Text(LocaleKeys.iWouldLikeHelpWithReachingTheHotel.tr(),style: Theme.of(context).textTheme.titleSmall,),
                    index==0?Align(alignment: AlignmentDirectional.center,child: Padding(
                      padding:  EdgeInsets.symmetric(vertical:15.h ,horizontal:10.w ),
                      child: mainButton(
                          text:LocaleKeys.cancelReport.tr() , color: orangeColor, context: context, fct: (){}),
                    )):const SizedBox(),

                    index==1?Card(
                      elevation: 3,
                      margin: EdgeInsetsDirectional.only(top: 10.h),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
                      child: Container(

                        padding: EdgeInsetsDirectional.only(end: 15.w),
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           // color: darkMainColor,
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: ListTile(

                                    leading: CircleAvatar(radius: 25.sp,backgroundImage: AssetImage('assets/images/profile.png'),),
                                  title: Text('احمد علي',style:Theme.of(context).textTheme.displayLarge ,),
                                  subtitle: RichText(text: TextSpan(text: '${LocaleKeys.phoneNumber.tr()} : ',style: Theme.of(context).textTheme.bodySmall,children: [
                                    TextSpan(text: '966542136547+',style: Theme.of(context).textTheme.headlineSmall,)
                                  ]),),


                                ),
                              ),
                            ),
                             Column(
                               mainAxisSize: MainAxisSize.min,
                               // mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                                 circleAvtarWidget(svgImage: 'assets/svg/msg.svg')
                               ],
                             ),
                          ],
                        ),
                      ),
                    ):SizedBox()
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
