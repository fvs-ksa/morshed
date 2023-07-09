import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/companions_cubit/cubit.dart';
import 'package:morshed/bloc/companions_cubit/state.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/inner_screen/add_companions_screen.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../component/info_profile_component.dart';
import '../../constant/const_color.dart';

class EscortsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var addCompanions = AddCompanionsCubit.get(context);
    return BlocConsumer<AddCompanionsCubit, AddCompanionsState>(
      bloc: addCompanions.getMyCompanions(),
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: backButtonWidget(context: context),
              title: Text('المرافقين'),
              centerTitle: true,
              actions: [SvgPicture.asset('assets/svg/')],
              backgroundColor: whiteColor,
              // toolbarHeight: 180.h,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(120.h),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.only(start: 18.0.w, end: 18.w,bottom: 18.h),
                    child: AutoSizeText('خدمه البحث عن طريق الاسم ورقم الجوال ما زالت تحت التطوير',maxLines: 1,style: TextStyle(
                        color: Colors.red,
                       // fontFamily: 'cairo',
                        fontWeight: FontWeight.bold

                    )),
                    // child: Row(
                    //   children: [
                    //     Expanded(
                    //         child: textFormField(
                    //             labelText: 'البحث عن طريق الاسم او رقم الجواز',
                    //             context: context)),
                    //     SizedBox(
                    //       width: 12.w,
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsetsDirectional.only(bottom: 14.0.h),
                    //       child: mainButton(
                    //           width: 73.w,
                    //           height: 54.h,
                    //           text: 'بحث',
                    //           color: darkMainColor,
                    //           context: context,
                    //           fct: () {}),
                    //     )
                    //   ],
                    // ),
                  )),
            ),
            // appBar: headerForGuide(
            //     context: context,
            //     title: LocaleKeys.Companions.tr(),
            //     fct: () {}),
            backgroundColor: whiteGreyColor,
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: state is GetCompanionLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 10.h, start: 8.w, end: 8.w),
                      child: addCompanions.getCompanions.companions == null
                          ? const Center(
                              child: Text('ليس لديك مرافقين حتى الآن'),
                            )
                          : ListView.builder(
                              itemCount: addCompanions
                                  .getCompanions.companions!.length,
                              itemBuilder: (context, index) {
                                return itemContainerOfGuidesAndEscorts(
                                  context: context,
                                  image: addCompanions.getCompanions
                                          .companions![index].image ??
                                      'assets/images/profile.png',
                                  name: addCompanions
                                      .getCompanions.companions![index].nameAr!,
                                  phone: addCompanions.getCompanions
                                      .companions![index].phoneNumber!,
                                );
                              }),
                    ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: FittedBox(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/Icon ionic-ios-add.svg'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      LocaleKeys.Companions.tr(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                navigateForward(const AddCompanionsScreen());
              },
            ),
          );
        });
  }
}
