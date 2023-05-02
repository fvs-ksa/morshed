import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../models/more_screen_model.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/header1.png', fit: BoxFit.fitHeight,),
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
          SizedBox(
            height: size.height * 0.65,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return index==9?Padding(
                  padding:  EdgeInsetsDirectional.only(top: size.height*0.02),
                  child: Text('تسجيل خروج',style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
                ):GestureDetector(
                  onTap:()=> moreList[index].onTap(),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Container(
                      height: size.height * 0.07,
                      padding: EdgeInsetsDirectional.only(
                          start: size.width * 0.05,
                          top: size.height * 0.01,
                          bottom: size.height * 0.01),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
                      child: Row(
                        children: [
                          SvgPicture.asset(moreList[index].svgImage),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            moreList[index].title,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: moreList.length,
            ),
          ),
        ],
      ),
    );
  }
}
