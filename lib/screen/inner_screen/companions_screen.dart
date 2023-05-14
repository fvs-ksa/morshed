import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/inner_screen/add_companions_screen.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../constant/const_color.dart';

class EscortsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerForGuide(context: context, title: LocaleKeys.Companions.tr(),fct: (){}),
      backgroundColor: whiteGreyColor,
      body: GestureDetector(
        onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 10.h,
              start: 8.w,
              end: 8.w),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return itemContainerOfGuidesAndEscorts(
                  context: context,
                  image: 'assets/images/profile.png',
                  name: 'أحمد محمد',
                  phone: '0506977241',
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: FittedBox(
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/Icon ionic-ios-add.svg'),
              SizedBox(width: 5.w,),
              Text(
                LocaleKeys.Companions.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        onPressed: () {
          navigateForward(
                    const AddCompanionsScreen());
        },
      ),
    );
  }
}
