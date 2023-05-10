import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../component/horizontal_dotted_line.dart';
import 'another_person_submit_report.dart';
import 'my_submit_report.dart';

class TabBarSubmitReport extends StatefulWidget {
  const TabBarSubmitReport({Key? key}) : super(key: key);

  @override
  State<TabBarSubmitReport> createState() => _TabBarSubmitReportState();
}

class _TabBarSubmitReportState extends State<TabBarSubmitReport>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  void setTabActive() {
    SubmitReportCubit.get(context)
        .changeTabBarIndex(value: tabController.index);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: SubmitReportCubit.get(context).index);
    tabController.addListener(setTabActive);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var submitReport = SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit, SubmitReportState>(
        listener: (context, state) {},
        builder: (context, state) {
          {
            return Scaffold(
              appBar: PreferredSize(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    fit: StackFit.expand,
                    children: [
                      Image.asset('assets/images/header1.png',
                          fit: BoxFit.cover),
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: screenSize.height*0.02,top: screenSize.height*0.15),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child:  DashedLine(color: whiteColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: screenSize.height * 0.05,
                            bottom:screenSize.height * 0.02 ,
                            start: screenSize.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  backButtonWidget(fct: () {Navigator.pop(context);}),
                                  SizedBox(
                                    width: screenSize.width * 0.24,
                                  ),
                                  Text(
                                    LocaleKeys.reporting.tr(),
                                    style:
                                        Theme.of(context).textTheme. displayMedium,
                                  )
                                ],
                              ),
                            ),
                            TabBar(controller: tabController, tabs: [
                              Tab(
                                child: Text(
                                  LocaleKeys.iLost.tr(),
                                  style: tabController.index == 0
                                      ? Theme.of(context).textTheme.labelLarge
                                      : Theme.of(context).textTheme.titleMedium,
                                ),
                                icon: SvgPicture.asset(
                                    tabController.index == 1? 'assets/svg/iLostActive.svg':'assets/svg/iLostInActive.svg'),
                                // text: 'انا تائه'
                              ),

                              Tab(
                                child: Text(
                                  LocaleKeys.anotherOneIsLost.tr(),
                                  style: tabController.index == 1
                                      ? Theme.of(context).textTheme.labelLarge
                                      : Theme.of(context).textTheme.titleMedium,
                                ),
                                icon: SvgPicture.asset(
                                    tabController.index == 0? 'assets/svg/anotherActive.svg':'assets/svg/anotherInActive.svg'),
                              ),
                            ])
                          ],
                        ),
                      )
                    ],
                  ),
                  preferredSize: Size.fromHeight(screenSize.height * 0.2)),
              body: TabBarView(
                controller: tabController,
                children: const [
                  // Widget for first tab
                  MySubmitReport(),
                  // Widget for second tab
                  SubmitReportAnotherPerson(),
                ],
              ),
            );
          }
        });
  }
}



