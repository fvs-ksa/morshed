import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/component/floating_Container.dart';
import 'package:morshed/component/home_screen_widget.dart';
import 'package:morshed/screen/inner_screen/my_card_screen.dart';
import 'package:sizer/sizer.dart';

import '../../component/horizontal_dotted_line.dart';
import '../../component/navigation_functions.dart';
import '../inner_screen/another_services_screens/another_services_screen.dart';
import '../inner_screen/submit_report/tab_submit_report.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.22,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/home bg.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: size.width * 0.06,start: size.width * 0.06,top: size.height*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/whiteMorshed.png',
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      fit: BoxFit.contain,
                    ),
                    GestureDetector(
                      onTap: (){navigateForward(MyCardScreen());},
                      child: Image.asset(
                        'assets/images/card.png',
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: size.width * 0.04,
                  start: size.width * 0.1,
                  end: size.width * 0.1),
              child: Column(
                children: [
                  Text(
                    'أهلا بك في تطبيق مرشد لا تقلق نحن هنا لخدمتك',
                    style: Theme.of(context).textTheme.headline1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.width * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      homeComponentWidget(style:Theme.of(context).textTheme.headline3 ,context: context, image: 'assets/images/report.png',
                          title: 'تقديم بلاغ لحاله توهان', fct: (){navigateForward(TabBarSubmitReport());}),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: size.width*0.09,start: size.width*0.09),
                        child: DashedLine(color: greyColor),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.only(end: size.width*0.09,start: size.width*0.09),
                      //   child: Align(
                      //     alignment: AlignmentDirectional.bottomCenter,
                      //     child: CustomPaint(
                      //       painter: DottedLinePainter(color: whiteGreyColor),
                      //       size: const Size(double.infinity, 20),
                      //       child: SizedBox(
                      //
                      //         width: size.width*0.01,
                      //         height: size.width*0.12,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      homeComponentWidget(fct: (){},context: context, image: 'assets/images/vedio.png', title: 'الاتصال المرئي',isWide: false),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: size.height*0.04,top: size.height*0.01),
                    child: MySeparator(color: greyColor),
                  ),
                  homeComponentWidget(fct: (){navigateForward(AnotherServicesScreen());},context: context, image: 'assets/images/other_services.png', title: 'خدمات اخرى'),
                  floatingContainer(
                      alignment: AlignmentDirectional.bottomStart,
                      context: context, svgAssets: 'assets/svg/Icon ionic-ios-add.svg', title: 'اضافه مرافق', width: size.width * 0.4,color:darkMainColor ),
                  SizedBox(height: size.height*0.02,),
                  floatingContainer(
                      alignment: AlignmentDirectional.bottomStart,
                      context: context, svgAssets: 'assets/svg/on map.svg', title: 'مكاتب الارشاد والمرشدين', width: size.width * 0.7,color:orangeColor ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
