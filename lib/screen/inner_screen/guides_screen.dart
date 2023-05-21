import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/guides_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/inner_screen/chat_with_guides.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../bloc/guides_cubit/cubit.dart';
import '../../constant/const_color.dart';

class GuidesScreen extends StatelessWidget {
  int? index;
  GuidesScreen({ this.index});
TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var guidesCubit=GuidesCubit.get(context);
    return BlocConsumer<GuidesCubit,GuidesState>(
      listener: (context,state){},
      builder: (context,state) {
        return GestureDetector(
          onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
          child: Scaffold(
            appBar: headerForGuide(
                context: context, title:index==1?'الاتصال المرئي': LocaleKeys.guides.tr(),searchController: searchController,
                  dropDownWidget:index==1? SizedBox():Container(
                    padding: EdgeInsetsDirectional.only(start: 10.w),
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
                            circleAvtarWidget(svgImage: 'assets/svg/end call.svg',fct: (){}),
                            circleAvtarWidget(svgImage: 'assets/svg/msg.svg',fct: (){navigateForward(ChatWithGuidesScreen());})
                          ],
                        ));
                  }),
            ),
          ),
        );
      }
    );
  }
}
