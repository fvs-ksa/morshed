import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/guides_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../../bloc/guides_cubit/cubit.dart';
import '../../constant/const_color.dart';

class GuidesScreen extends StatelessWidget {
TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var guidesCubit=GuidesCubit.get(context);
    return BlocConsumer<GuidesCubit,GuidesState>(
      listener: (context,state){},
      builder: (context,state) {
        return Scaffold(
          appBar: headerForGuide(
              context: context, title: LocaleKeys.guides.tr(),searchController: searchController,
                dropDownWidget: Container(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                //  padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.02),
                    // height:54.h,
                    // width: 62.w,
                  height: 90.h,
                  width: 88.w,
                  child: dropDownButton(items: guidesCubit.flags.map((e) {
                    return DropdownMenuItem(child: Image.asset(e["flag"].toString()),value: e['id'].toString(),);
                  }).toList(),
                      value: guidesCubit.flag,
                      isFlag: true,
                      hint:LocaleKeys.country.tr() ,
                      fct: (onChange){
                    guidesCubit.onChangeFlagsSearch(onChange);
                    print(onChange);
                      },
                      context: context,
                      validator: (){}),
                ),
            fct: (){}
          ),
          // appBar: preferredHeaderWithGuide(
          //     context: context,
          //     dropDownWidget: Container(
          //       padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.02),
          //         height: screenSize.height * 0.1,
          //         width: screenSize.width * 0.3,
          //       child: dropDownButton(items: guidesCubit.flags.map((e) {
          //         return DropdownMenuItem(child: Image.asset(e["flag"].toString()),value: e['id'].toString(),);
          //       }).toList(),
          //           value: guidesCubit.flag,
          //           hint: LocaleKeys.country.tr(),
          //           fct: (onChange){
          //         guidesCubit.onChangeFlagsSearch(onChange);
          //         print(onChange);
          //           },
          //           context: context,
          //           validator: (){}),
          //     ),
          //     title:LocaleKeys.guides.tr(),
          //   searchController:searchController ,
          //   fct: (){}
          //     ),
          backgroundColor: whiteGreyColor,
          body: Padding(
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
                      name: 'احمد محمد',
                      phone: '0506977241',
                      contactColumn: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                          circleAvtarWidget(svgImage: 'assets/svg/msg.svg')
                        ],
                      ));
                }),
          ),
        );
      }
    );
  }
}
