import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/const_color.dart';
import '../../../component/guide_escorts_component.dart';
import '../../../translation/locale_keys.g.dart';

class MyReportsDetailsScreen extends StatelessWidget {
  int index;

  MyReportsDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context, title:LocaleKeys.reportDetails.tr() , isActive: false),
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
                    height: screenSize.height * 0.07,
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
                        ? Theme.of(context).textTheme.bodyText1
                        : Theme.of(context).textTheme.button,
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04,vertical: screenSize.height*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height*0.05,),
                    textFormField(labelText:LocaleKeys.reportNumber.tr(),  context: context,isEnabled: false),
                    textFormField(labelText:LocaleKeys.passportNo.tr() ,  context: context,isEnabled: false),
                    textFormField(labelText:LocaleKeys.reportLocation.tr(),  context: context,isEnabled: false),
                    bigTextFieldForNotes(context: context, hint:LocaleKeys.commentsAndAssistance.tr() ),
                    // SizedBox(
                    //   height: screenSize.height*0.17,
                    //  // color: Colors.red,
                    //   child: Stack(
                    //     alignment: AlignmentDirectional.topEnd,
                    //     children: [
                    //       Padding(
                    //         padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.03),
                    //         child: textFormField(labelText: 'ملاحظات',  context: context,lines: 5,isEnabled: false),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsetsDirectional.only(end: screenSize.height*0.05),
                    //         child: CircleAvatar(
                    //           radius: screenSize.width*0.07,
                    //           backgroundColor: babyBlueColor,child: SvgPicture.asset('assets/svg/file (1).svg'),),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    //SizedBox(height: screenSize.height*0.06,),
                    Text(LocaleKeys.WhatCanWeDoToAssistYou.tr(),style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: screenSize.height*0.01,),
                    Text(LocaleKeys.iWouldLikeHelpWithReachingTheHotel.tr(),style: Theme.of(context).textTheme.subtitle2,),
                    index==0?Align(alignment: AlignmentDirectional.center,child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: screenSize.height*0.06,horizontal: screenSize.width*0.03),
                      child: mainButton(width: screenSize.width*0.8, height: screenSize.height*0.07,
                          text:LocaleKeys.cancelReport.tr() , color: orangeColor, context: context, fct: (){}),
                    )):const SizedBox(),

                    index==1?Card(
                      elevation: 3,
                      margin: EdgeInsetsDirectional.only(top: screenSize.height*0.05),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenSize.width*0.05)),
                      child: Container(

                        padding: EdgeInsetsDirectional.only(end: screenSize.width*0.04),
                        height: screenSize.height*0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           // color: darkMainColor,
                            borderRadius: BorderRadius.circular(screenSize.width*0.05)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: ListTile(

                                    leading: CircleAvatar(radius: 20.sp,backgroundImage: AssetImage('assets/images/profile.png'),),
                                  title: Text('احمد علي',style:Theme.of(context).textTheme.headline1 ,),
                                  subtitle: RichText(text: TextSpan(text: '${LocaleKeys.phoneNumber.tr()} : ',style: Theme.of(context).textTheme.caption,children: [
                                    TextSpan(text: '966542136547+',style: Theme.of(context).textTheme.headline5,)
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
