import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/info_profile_component.dart';

import '../../../component/guide_escorts_component.dart';

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
                        padding: EdgeInsetsDirectional.only(bottom: screenSize.height*0.02,),
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child:  CustomPaint(
                            painter: DottedLinePainter(),
                            child: SizedBox(

                              width: screenSize.width*0.01,
                              height: screenSize.width*0.12,
                             ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: screenSize.height * 0.07,
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
                                    'تقديم بلاغ',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  )
                                ],
                              ),
                            ),
                            TabBar(controller: tabController, tabs: [
                              Tab(
                                child: Text(
                                  'انا تائه',
                                  style: tabController.index == 0
                                      ? Theme.of(context).textTheme.button
                                      : Theme.of(context).textTheme.subtitle1,
                                ),
                                icon: SvgPicture.asset(
                                    'assets/svg/me-1.svg'),
                                // text: 'انا تائه'
                              ),

                              Tab(
                                child: Text(
                                  'شخص اخر',
                                  style: tabController.index == 1
                                      ? Theme.of(context).textTheme.button
                                      : Theme.of(context).textTheme.subtitle1,
                                ),
                                icon: SvgPicture.asset(
                                    'assets/svg/Group 204379.svg'),
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
                children: [
                  // Widget for first tab
                  Container(
                    child: Center(
                      child: Text('Tab 1'),
                    ),
                  ),
                  // Widget for second tab
                  Container(
                    child: Center(
                      child: Text('Tab 2'),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashWidth = 5;
    final dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
// AppBar(
//
// title: Text('My App'),
// bottom: TabBar(
// controller: tabController,
// tabs: [
// Tab(
// text: 'Tab 1',
// ),
// Tab(
// text: 'Tab 2',
// ),
// ],
// ),
// ),
