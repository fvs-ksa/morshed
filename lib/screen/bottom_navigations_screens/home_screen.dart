import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/component/floating_Container.dart';
import 'package:sizer/sizer.dart';

import '../inner_screen/submit_report/tab_submit_report.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/home bg.png',
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/whiteMorshed.png',
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: size.width * 0.1,
              start: size.width * 0.1,
              end: size.width * 0.1),
          child: Column(
            children: [
              Text(
                'اهلا بك في تطبيق مرشد لا تقلق نحن هنا لخدمتك',
                style: Theme.of(context).textTheme.headline1,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){navigateForward(TabBarSubmitReport());},
                    child: Container(
                      height: size.height * 0.15,
                      width: size.width * 0.2,
                      child: Column(
                        children: [
                          Image.asset('assets/images/report.png'),
                          Text(
                            'تقديم بلاغ لحاله توهان',
                            style: Theme.of(context).textTheme.headline3,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Container(
                    height: size.height * 0.15,
                    width: size.width * 0.2,
                    child: Column(
                      children: [
                        Image.asset('assets/images/vedio.png'),
                        Text(
                          'الاتصال المرئي',
                          style: Theme.of(context).textTheme.bodyText2,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height * 0.15,
                width: size.width * 0.2,
                child: Column(
                  children: [
                    Image.asset('assets/images/other_services.png'),
                    Text(
                      'خدمات اخرى',
                      style: Theme.of(context).textTheme.bodyText2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              floatingContainer(context: context, svgAssets: 'assets/svg/Icon ionic-ios-add.svg', title: 'اضافه مرافق', width: size.width * 0.4,color:darkMainColor ),
              SizedBox(height: size.height*0.02,),
              floatingContainer(context: context, svgAssets: 'assets/svg/on map.svg', title: 'مكاتب الارشاد والمرشدين', width: size.width * 0.7,color:orangeColor ),

            ],
          ),
        )
      ],
    );
  }
}
