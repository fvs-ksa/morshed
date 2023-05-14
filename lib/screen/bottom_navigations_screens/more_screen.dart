import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/auth_header_widget.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/inner_screen/subscription_screen.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../models/more_screen_model.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/header1.png', fit: BoxFit.fitHeight,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    whiteMorshedLogo(image: 'assets/images/whiteMorshed.png'),
                    GestureDetector(
                      onTap:()=> navigateForward(const SubscriptionScreen()),
                      child: Stack(

                      //  fit: StackFit.passthrough,
                        alignment: Alignment.center,
                        children: [
                          FittedBox(
                            child: Container(
                              padding: EdgeInsetsDirectional.only(end:6.w,start: 6.w),
                              height: 61.h,
                              width: 144.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/images/supscription.png'), fit: BoxFit.cover)),
                              child:  FittedBox(child: Center(
                                  child: Text(LocaleKeys.morshedSubscription.tr(),
                                    textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelLarge,))),
                            ),
                          ),


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
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return index==9?Padding(
                padding:  EdgeInsetsDirectional.only(top:8.h ),
                child: Text(LocaleKeys.logOut.tr(),style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              ):GestureDetector(
                onTap:()=> moreList[index].onTap(),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Container(
                    height: 64.h,
                    padding: EdgeInsetsDirectional.only(
                        start:24.w,
                        top: 3.h,
                        bottom: 3.h),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
                    child: Row(
                      children: [
                        SvgPicture.asset(moreList[index].svgImage),
                        SizedBox(
                          width: 8.w,
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
      ],
    );
  }
}
