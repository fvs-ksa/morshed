import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../component/component.dart';
import '../../constant/const_color.dart';
import '../../component/info_profile_component.dart';

class MyResidenceAndTravels extends StatelessWidget {
  const MyResidenceAndTravels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
            child: Stack(
              children: [
                Container(
                  height:190.h,
                  child: Center(child: FittedBox(child: Text(LocaleKeys.myAccommodationAndTrips.tr(),style: Theme.of(context).textTheme.displayMedium,))),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 14.w,top:
                  140.h),
                  child: CircleAvatar(backgroundColor: darkMainColor,child: Image.asset('assets/images/profile.png'),
                    radius: 45.sp,
                  ),
                )
              ],
            ),
            preferredSize: Size.fromHeight(220.h)),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
              child: Column(
                children: [
                  textFormField(labelText: LocaleKeys.residentialAddress.tr(),  context: context,),
                  textFormField(labelText: LocaleKeys.mennaNo.tr(),  context: context),
                  textFormField(labelText: LocaleKeys.arfaNo.tr(), context: context),
                  textFormField(labelText: LocaleKeys.mozdalefaNo.tr(),  context: context),
                  textFormField(labelText: LocaleKeys.visaNo.tr(),  context: context),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:1,
                          child: textFormField(
                            isEnabled: false,
                            context: context,
                            labelText:'14/2/1966',
                            hintText: '14/2/1966',
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        GestureDetector(
                            onTap: () async {
                            //  profileCubit.chooseDateTime(context: context);
                            },
                            child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:1,
                          child: textFormField(
                            isEnabled: false,
                            context: context,
                            labelText:'14/2/1966',
                            hintText: '14/2/1966',
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        GestureDetector(
                            onTap: () async {
                              //  profileCubit.chooseDateTime(context: context);
                            },
                            child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
