import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morshed/bloc/show_office_provider_info/cubit.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/screen/map_tap_bar_screen/office_location_sccren.dart';
import 'package:morshed/screen/map_tap_bar_screen/provider_location_screen.dart';

import '../../bloc/show_office_provider_info/state.dart';
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
  late TabController tabController;
  TextEditingController searchController = TextEditingController();

  void setTabActive() {
    ShowOfficesAndProviderInfoCubit.get(context)
        .changeTabBarIndex(value: tabController.index);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: ShowOfficesAndProviderInfoCubit.get(context).index);
    tabController.addListener(setTabActive);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowOfficesAndProviderInfoCubit,ShowOfficesAndProviderInfoState>(
      listener: (context,state){},
      builder: (context,state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 170.h,
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TextFormField(

                  controller: searchController,
                  decoration: InputDecoration(
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
                            controller: tabController, tabs: [
                          Tab(
                            child: AutoSizeText(
                              'مكاتب الارشاد',
                              presetFontSizes: [15.sp, 13.sp, 9.sp],
                              style: tabController.index == 0
                                  ? Theme.of(context).textTheme.labelLarge
                                  : GoogleFonts.cairo(
                                  fontSize: 17.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: SvgPicture.asset(
                                tabController.index != 1 ?
                                'assets/svg/office_active.svg':
                                'assets/svg/office_inactive.svg'
                               // ?'assets/svg/office_inactive.svg'
                                   // : 'assets/svg/office_inactive.svg'
                            ),
                            // text: 'انا تائه'
                          ),
                          Tab(
                            child: AutoSizeText(
                              'مقدمي خدمه ارشاد',
                              presetFontSizes: [15.sp, 13.sp, 9.sp],
                              style: tabController.index == 1
                                  ? Theme.of(context).textTheme.labelLarge
                                  : GoogleFonts.cairo(
                                  fontSize: 17.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: SvgPicture.asset(
                                tabController.index == 0
                                    ? 'assets/svg/anotherActive.svg'
                                    : 'assets/svg/anotherInActive.svg'),
                          ),
                        ]),
                      )
                    ],
                  ),
                  preferredSize: Size.fromHeight(90.h)),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
                controller: tabController, children: const [
              OfficesLocationScreen(),
              ProvidersLocationScreen(),
            ]),
          ),
        );
      }
    );
  }
}
//