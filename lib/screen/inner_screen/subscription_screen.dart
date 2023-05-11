import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/component/component.dart';

import '../../component/guide_escorts_component.dart';
import '../../component/navigation_functions.dart';
import '../../constant/const_color.dart';
import '../../translation/locale_keys.g.dart';
import '../bottom_navigations_screens/main_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: headerOfTechnicalSupport(context: context, title: LocaleKeys.subscription.tr()),
      // appBar: preferredHeaderWithGuide(
      //     context: context, title:LocaleKeys.subscription.tr(), isActive: false),
      body: Padding(
        padding:EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                 // margin: EdgeInsetsDirectional.only(start: screenSize.width*0.03),
                  //padding: EdgeInsetsDirectional.only(end: 15.w),
                  height: 214.h,
                  width:373.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp),
                          bottomLeft: Radius.circular(20.sp)),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/bundle bg.png'), fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     // padding: EdgeInsetsDirectional.only(start: screenSize.width*0.03),
                      margin: EdgeInsetsDirectional.symmetric(
                          vertical: 10.h,horizontal: 30.w),
                      child: Center(child: Text(LocaleKeys.theSubscriptionPackage.tr(),style: Theme.of(context).textTheme.titleLarge,
                       // textAlign: TextAlign.center,
                      )),
                      width:310.w ,
                      height:51.h,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20.sp)),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.w),

                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: LocaleKeys.unlimitedDuringSubscription.tr(),style: Theme.of(context).textTheme.labelMedium)

                      ],text: LocaleKeys.availableNumberOfReports.tr(),style: Theme.of(context).textTheme.labelMedium),),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text:'2' ,style: Theme.of(context).textTheme.labelMedium)
                      ],text: LocaleKeys.numberOfReportsYouHaveMade.tr(),style: Theme.of(context).textTheme.labelMedium),),
                    )
                  ],
                )
              ],
            ),
            // ClipRRect(
            // borderRadius: Bo,child: Image.asset('assets/images/bundle bg.png',width: screenSize.width*0.9,)),
            Spacer(),
            mainButton(
                //width: double.infinity, height: screenSize.height*0.07,
                textStyle: Theme.of(context).textTheme.bodyLarge,
                borderColor: darkMainColor,
                text:LocaleKeys.renewSubscription.tr(), color: whiteColor, context: context, fct: (){
                  navigateForward(MainScreen());
                }),
           SizedBox(height: 30.h,),
           // mainButton(width: screenSize.width*0.7, height: height, text: text, color: color, context: context, fct: fct)
            Text(LocaleKeys.cancelSubscription.tr(),style: Theme.of(context).textTheme.headlineMedium,),
          ],
        ),
      ),
    );
  }
}
