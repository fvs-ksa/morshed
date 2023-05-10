import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/inner_screen/subscription_screen.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import 'package:sizer/sizer.dart';

import '../../models/more_screen_model.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.25,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/header1.png', fit: BoxFit.fitHeight,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/whiteMorshed.png',
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      fit: BoxFit.contain,
                    ),
                    GestureDetector(
                      onTap:()=> navigateForward(const SubscriptionScreen()),
                      child: Stack(
                      //  fit: StackFit.passthrough,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.only(end: size.width * 0.04),
                            height: size.height * 0.07,
                            width: size.width*0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width * 0.04),
                                    topRight: Radius.circular(size.width * 0.04),
                                    bottomRight: Radius.circular(size.width * 0.04),
                                    bottomLeft: Radius.circular(size.width * 0.04)),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/supscription.png'), fit: BoxFit.cover)),
                          ),
                          FittedBox(child: Text(LocaleKeys.morshedSubscription.tr(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelLarge,))

                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: size.height * 0.65,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return index==9?Padding(
                  padding:  EdgeInsetsDirectional.only(top: size.height*0.02),
                  child: Text(LocaleKeys.logOut.tr(),style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                ):GestureDetector(
                  onTap:()=> moreList[index].onTap(),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Container(
                      height: size.height * 0.07,
                      padding: EdgeInsetsDirectional.only(
                          start: size.width * 0.05,
                          top: size.height * 0.01,
                          bottom: size.height * 0.01),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
                      child: Row(
                        children: [
                          SvgPicture.asset(moreList[index].svgImage),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            moreList[index].title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: moreList.length,
            ),
          ),
        ),
      ],
    );
  }
}
