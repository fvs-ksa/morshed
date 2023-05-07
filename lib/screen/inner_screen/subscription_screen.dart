import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
      appBar: preferredHeaderWithGuide(
          context: context, title:LocaleKeys.subscription.tr(), isActive: false),
      body: Padding(
        padding:EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.06,vertical: screenSize.height*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(end: screenSize.width * 0.04),
                  height: screenSize.height * 0.26,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenSize.width * 0.04),
                          topRight: Radius.circular(screenSize.width * 0.04),
                          bottomRight: Radius.circular(screenSize.width * 0.04),
                          bottomLeft: Radius.circular(screenSize.width * 0.04)),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/bundle bg.png'), fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(vertical: screenSize.height*0.02,horizontal: screenSize.width*0.06),
                      child: Center(child: Text(LocaleKeys.theSubscriptionPackage.tr(),style: Theme.of(context).textTheme.headline6,
                       // textAlign: TextAlign.center,
                      )),
                      width:screenSize.width*0.8 ,
                      height: screenSize.height*0.07,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    RichText(text: TextSpan(children: [
                      TextSpan(text: LocaleKeys.unlimitedDuringSubscription.tr(),style: Theme.of(context).textTheme.bodySmall)

                    ],text: LocaleKeys.availableNumberOfReports.tr(),style: Theme.of(context).textTheme.bodySmall),)
                  ],
                )
              ],
            ),
            // ClipRRect(
            // borderRadius: Bo,child: Image.asset('assets/images/bundle bg.png',width: screenSize.width*0.9,)),
            Spacer(),
            mainButton(width: double.infinity, height: screenSize.height*0.07,
                textStyle: Theme.of(context).textTheme.bodyText1,
                borderColor: darkMainColor,
                text:LocaleKeys.renewSubscription.tr(), color: whiteColor, context: context, fct: (){
                  navigateForward(MainScreen());
                }),
           // mainButton(width: screenSize.width*0.7, height: height, text: text, color: color, context: context, fct: fct)
            Text(LocaleKeys.cancelSubscription.tr(),style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }
}
