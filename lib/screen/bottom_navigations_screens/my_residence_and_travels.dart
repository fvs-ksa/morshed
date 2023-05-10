import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import 'package:sizer/sizer.dart';
import '../../component/component.dart';
import '../../constant/const_color.dart';
import '../../component/info_profile_component.dart';

class MyResidenceAndTravels extends StatelessWidget {
  const MyResidenceAndTravels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        PreferredSize(
            child: Stack(
              children: [
                Container(
                  height: screenSize.height * 0.2,
                  child: Center(child: FittedBox(child: Text(LocaleKeys.myAccommodationAndTrips.tr(),style: Theme.of(context).textTheme.displayMedium,))),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.03,top: screenSize.height*0.15),
                  child: CircleAvatar(backgroundColor: darkMainColor,child: Image.asset('assets/images/profile.png'),
                    radius: screenSize.height*0.05,
                  ),
                )
              ],
            ),
            preferredSize: Size.fromHeight(screenSize.height * 0.25)),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  textFormField(labelText: LocaleKeys.residentialAddress.tr(),  context: context,),
                  textFormField(labelText: LocaleKeys.mennaNo.tr(),  context: context),
                  textFormField(labelText: LocaleKeys.arfaNo.tr(), context: context),
                  textFormField(labelText: LocaleKeys.mozdalefaNo.tr(),  context: context),
                  textFormField(labelText: LocaleKeys.visaNo.tr(),  context: context),
                  Row(
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
                      SizedBox(width: screenSize.width*0.07,),
                      GestureDetector(
                          onTap: () async {
                          //  profileCubit.chooseDateTime(context: context);
                          },
                          child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                      ),
                    ],
                  ),
                  Row(
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
                      SizedBox(width: screenSize.width*0.07,),
                      GestureDetector(
                          onTap: () async {
                            //  profileCubit.chooseDateTime(context: context);
                          },
                          child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                      ),
                    ],
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
