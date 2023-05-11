import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/boarding_cubit/state.dart';
import 'package:morshed/component/auth_header_widget.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/models/boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'account_type_screen.dart';

class BoardingScreen extends StatelessWidget {
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('Size :${size.height}');
    print('Size Width :${size.width}');
    var boardingCubit = BoardingCubit.get(context);
    return BlocConsumer<BoardingCubit, BoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsetsDirectional.only(top: 100.h,end: 30.w,start: 30.w),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: whiteMorshedLogo(image: 'assets/images/مرشد.png'),
                    // child: Image.asset(
                    //   'assets/images/مرشد.png',
                    //   height: 94.h,
                    //   width: 154.w,
                    // ),
                  ),
                  SizedBox(
                    height:50.h,
                  ),
                  Expanded(
                    child: PageView.builder(

                      itemCount: boardingList.length,
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return boardingWidget(boardingList[index], context);
                      },
                      onPageChanged: (int i) {
                        if (i == boardingList.length - 1) {
                          print('last');
                          boardingCubit.changeLastBoarding();
                        } else {
                          boardingCubit.isLastBoarding =
                              !boardingCubit.isLastBoarding;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(bottom: 50.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: boardingList.length,
                          effect: SlideEffect(
                            activeDotColor: lightMainColor,
                            dotColor: greyColor,
                            // dotHeight: size.height * 0.003,
                            // dotWidth: size.width * 0.3,
                            dotWidth: 104.w,
                            dotHeight: 4.h
                          ),
                        ),
                        // SizedBox(width: size.width*0.04,),
                        floatingButton(
                            fct: () {
                              if (boardingCubit.isLastBoarding == true) {
                                print('object');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const AccountTypeScreen()),
                                );
                                //navigateForward(AccountTypeScreen());
                                // Get.to(const AccountTypeScreen());
                              } else {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget boardingWidget(BoardingModel model, BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
           // color: Colors.red,
            //  borderRadius: BorderRadius.circular(10),
            shape: BoxShape.circle),
      ),
      Align(
          alignment: Alignment.center,
          child: Image.asset(
            model.image,
          )),
      SizedBox(
       // height: size.height * 0.05,
        height: 45.h,
      ),
      Text(
        model.title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      SizedBox(
        height:10.h,
      ),
      Text(
        model.subTitle,
        style: Theme.of(context).textTheme.bodySmall,
      )
    ],
  );
}
