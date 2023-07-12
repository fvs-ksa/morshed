import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morshed/bloc/show_office_provider_info/cubit.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/screen/map_tap_bar_screen/office_location_sccren.dart';
import 'package:morshed/screen/map_tap_bar_screen/provider_location_screen.dart';

import '../../component/horizontal_dotted_line.dart';
import '../../component/info_profile_component.dart';
import '../../translation/locale_keys.g.dart';

class MapTabBarScreen extends StatefulWidget {
  const MapTabBarScreen({super.key});

  @override
  State<MapTabBarScreen> createState() => _MapTabBarScreenState();
}

class _MapTabBarScreenState extends State<MapTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tapController;
  TextEditingController searchController = TextEditingController();

  void setTabActive() {
    ShowOfficesAndProviderInfoCubit.get(context)
        .changeTabBarIndex(value: tapController.index);
  }

  @override
  void initState() {
    super.initState();
    tapController = TabController(
        length: 2,
        vsync: this,
        initialIndex: ShowOfficesAndProviderInfoCubit.get(context).index);
    tapController.addListener(setTabActive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     child: Stack(
      //       alignment: AlignmentDirectional.center,
      //       fit: StackFit.expand,
      //       children: [
      //         Image.asset('assets/images/header1.png',
      //             fit: BoxFit.cover),
      //         Padding(
      //           padding: EdgeInsetsDirectional.only(
      //               bottom: 40.h, top: 15.h),
      //           child: Align(
      //             alignment: AlignmentDirectional.bottomCenter,
      //             child: DashedLine(
      //                 color: whiteColor,
      //                 height: 10.h,
      //                 heightContainer: 60.h),
      //           ),
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //            // textFormField(labelText: labelText, context: context)
      //             Container(
      //
      //               child: TextFormField(
      //                 controller: searchController,
      //                 decoration: InputDecoration(
      //                     contentPadding:
      //                     EdgeInsetsDirectional.only(start: 10.w, ),
      //                     constraints: BoxConstraints(
      //                         minHeight: 54.h,
      //                         minWidth:  330.w,
      //                         maxHeight: 54.h,
      //                         maxWidth:  360.w),
      //                     prefixIcon: backButtonWidget(context: context),
      //                     labelText: 'labelText',
      //                     labelStyle: GoogleFonts.cairo(
      //                         fontSize: 14.sp, fontWeight: FontWeight.w600, color: greyColor),
      //                     hintText: 'hintText',
      //                     errorStyle: GoogleFonts.cairo(fontSize: 8,color: Colors.red),
      //                     hintStyle: GoogleFonts.cairo(
      //                         fontSize: 14.sp, fontWeight: FontWeight.w600, color: greyColor),
      //                     border:
      //                     OutlineInputBorder(borderRadius: BorderRadius.circular(20.sp))),
      //               ),
      //               height: 80.h,
      //               color: whiteColor,
      //               padding: EdgeInsets.zero,
      //             ),
      //             // Expanded(
      //             //   child: Row(
      //             //     mainAxisAlignment: MainAxisAlignment.start,
      //             //     children: [
      //             //       backButtonWidget(context: context),
      //             //       Expanded(
      //             //         flex: 4,
      //             //         child: Text(
      //             //           LocaleKeys.reporting.tr(),
      //             //           textAlign: TextAlign.center,
      //             //           style: Theme.of(context)
      //             //               .textTheme
      //             //               .displayMedium,
      //             //         ),
      //             //       ),
      //             //       Expanded(
      //             //         flex: 1,
      //             //         child: Container(),
      //             //       )
      //             //     ],
      //             //   ),
      //             // ),
      //             Padding(
      //               padding: EdgeInsetsDirectional.only(
      //                 top: 30.h, bottom: 20.h,),
      //               child: TabBar(controller: tapController, tabs: [
      //                 Tab(
      //                   child: AutoSizeText(
      //                     LocaleKeys.iLost.tr(),
      //                     presetFontSizes: [15.sp, 13.sp, 9.sp],
      //                     style: tapController.index == 0
      //                         ? Theme.of(context).textTheme.labelLarge
      //                         : GoogleFonts.cairo(
      //                         fontSize: 17.sp,
      //                         color: whiteColor,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                   icon: SvgPicture.asset(
      //                       tapController.index == 1
      //                           ? 'assets/svg/iLostActive.svg'
      //                           : 'assets/svg/iLostInActive.svg'),
      //                   // text: 'انا تائه'
      //                 ),
      //                 Tab(
      //                   child: AutoSizeText(
      //                     LocaleKeys.anotherOneIsLost.tr(),
      //                     presetFontSizes: [15.sp, 13.sp, 9.sp],
      //                     style: tapController.index == 1
      //                         ? Theme.of(context).textTheme.labelLarge
      //                         : GoogleFonts.cairo(
      //                         fontSize: 17.sp,
      //                         color: whiteColor,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                   icon: SvgPicture.asset(
      //                       tapController.index == 0
      //                           ? 'assets/svg/anotherActive.svg'
      //                           : 'assets/svg/anotherInActive.svg'),
      //                 ),
      //               ]),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //     preferredSize: Size.fromHeight(180.h)),

      appBar: AppBar(
        toolbarHeight: 170.h,
      //  foregroundColor: whiteColor,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: TextFormField(

            controller: searchController,
            decoration: InputDecoration(

                // contentPadding: EdgeInsetsDirectional.only(
                //   start: 0,
                // ),
                constraints: BoxConstraints(
                    minHeight: 54.h,
                    minWidth: 330.w,
                    maxHeight: 54.h,
                    maxWidth: 360.w),
                prefixIcon: backButtonWidget(context: context),
                labelText: 'بحث عن مكتب ارشاد',
                labelStyle: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
                hintText: 'بحث',
                errorStyle: GoogleFonts.cairo(fontSize: 8, color: Colors.red),
                hintStyle: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp))),
          ),
        ),
        bottom: PreferredSize(
            child: Stack(
              alignment: AlignmentDirectional.center,
              //fit: StackFit.expand,
              children: [
                Image.asset('assets/images/header1.png',

                    fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      bottom: 10.h, top: 15.h),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: DashedLine(
                        color: whiteColor,
                        height: 10.h,
                        heightContainer: 60.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 10.h, bottom: 5.h, start: 20.w),
                  child: TabBar(
                      padding: EdgeInsets.zero,
                      dividerColor: whiteColor,
                      controller: tapController, tabs: [
                    Tab(
                      child: AutoSizeText(
                        'مكاتب الارشاد',
                        presetFontSizes: [15.sp, 13.sp, 9.sp],
                        style: tapController.index == 0
                            ? Theme.of(context).textTheme.labelLarge
                            : GoogleFonts.cairo(
                            fontSize: 17.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: SvgPicture.asset(
                          tapController.index == 1
                              ? 'assets/svg/iLostActive.svg'
                              : 'assets/svg/iLostInActive.svg'),
                      // text: 'انا تائه'
                    ),
                    Tab(
                      child: AutoSizeText(
                        'مقدمي خدمه ارشاد',
                        presetFontSizes: [15.sp, 13.sp, 9.sp],
                        style: tapController.index == 1
                            ? Theme.of(context).textTheme.labelLarge
                            : GoogleFonts.cairo(
                            fontSize: 17.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: SvgPicture.asset(
                          tapController.index == 0
                              ? 'assets/svg/anotherActive.svg'
                              : 'assets/svg/anotherInActive.svg'),
                    ),
                  ]),
                )
              ],
            ),
            preferredSize: Size.fromHeight(90.h)),
      ),
      body: TabBarView(controller: tapController, children: [
        OfficesLocationScreen(),
        ProvidersLocationScreen(),
      ]),
    );
  }
}
