import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/component/reports_widgets.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../../../component/guide_escorts_component.dart';
import '../../../component/navigation_functions.dart';
import '../../../models/my_reports_model.dart';
import 'my_reports_details.dart';

class MyReports extends StatelessWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerOfTechnicalSupport(context: context, title: LocaleKeys.myReports.tr()),
      // appBar: preferredHeaderWithGuide(
      //     context: context, title:LocaleKeys.myReports.tr() , isActive: false),
      backgroundColor: whiteGreyColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){navigateForward( MyReportsDetailsScreen(index:reportsList[index].status ,));},
            child: myReportsContainerWidget(
                context: context,
                style:reportsList[index].status == 2? Theme.of(context).textTheme.bodyLarge:null,
                solutionWidget:reportsList[index].status == 0?IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svg/delete.svg')):
                reportsList[index].status == 1?Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                  SizedBox(width: 5.w,),
                  circleAvtarWidget(svgImage: 'assets/svg/msg.svg'),
                ],):const SizedBox() ,
                reportStatus: reportsList[index].status == 0
                    ?LocaleKeys.underProcessing.tr()
                    : reportsList[index].status == 1
                    ?LocaleKeys.guideOnTheWay.tr()
                    :LocaleKeys.Resolved.tr() ,
                reportId: reportsList[index].reportNumber,
                backgroundImage:reportsList[index].status == 0
                    ? 'assets/images/Group 204373.png'
                    : reportsList[index].status == 1
                    ? 'assets/images/Group 204372.png'
                    : 'assets/images/Group 204371.png',),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
