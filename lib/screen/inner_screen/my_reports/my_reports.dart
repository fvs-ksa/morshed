import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/component/reports_widgets.dart';

import '../../../component/guide_escorts_component.dart';
import '../../../models/my_reports_model.dart';
import 'mt_reports_details.dart';

class MyReports extends StatelessWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context, title: 'بلاغاتي', isActive: false),
      backgroundColor: whiteGreyColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){navigateForward( MyReportsDetailsScreen(index:reportsList[index].status ,));},
            child: myReportsContainerWidget(
                context: context,
                style:reportsList[index].status == 2? Theme.of(context).textTheme.bodyText1:null,
                solutionWidget:reportsList[index].status == 0?IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svg/delete.svg')):
                reportsList[index].status == 1?Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                  SizedBox(width: screenSize.width*0.02,),
                  circleAvtarWidget(svgImage: 'assets/svg/msg.svg'),
                ],):const SizedBox() ,
                reportStatus: reportsList[index].status == 0
                    ? 'تحت المعالجه'
                    : reportsList[index].status == 1
                    ? 'المرشد في الطريق'
                    : 'تمت المعالجه',
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