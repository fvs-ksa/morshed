import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/boarding_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/models/boarding_model.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'account_type_screen.dart';

class BoardingScreen extends StatelessWidget {
  // const BoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var boardingCubit = BoardingCubit.get(context);
    return BlocConsumer<BoardingCubit, BoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding:  EdgeInsetsDirectional.only(top: size.height*0.03,end: size.width*0.07,start:size.width*0.07 ),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Image.asset('assets/images/مرشد.png',height:size.height*0.2,width: size.width*0.3 ,),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Expanded(
                    child: PageView.builder(
                        itemCount: boardingList.length,
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return boardingWidget(boardingList[index],context);
                        },
                    onPageChanged: (int i){
                          if(i==boardingList.length-1){
                            boardingCubit.changeBoarding();
                          }else{
                            boardingCubit.isLastBoarding=!boardingCubit.isLastBoarding;
                          }
                    },
                    ),
                  ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SmoothPageIndicator(controller: pageController, count: boardingList.length,effect: SlideEffect(
                           activeDotColor: lightMainColor,
                           dotColor: greyColor,

                          // paintStyle: PaintingStyle.stroke,

                           //radius: 1,
                         dotHeight: size.height*0.003,
                         dotWidth: size.width*0.3,
                       ),),
                      // SizedBox(width: size.width*0.04,),
                       floatingButton(context:context,fct: (){
                         if(boardingCubit.isLastBoarding){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountTypeScreen()),);
                             //navigateForward(AccountTypeScreen());
                          // Get.to(const AccountTypeScreen());
                         }else{
                           pageController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
                         }
                       }),
                     ],
                   ),

                ],
              ),
            ),
          );
        });
  }
}

Widget boardingWidget(BoardingModel model,BuildContext context) {
  Size size=MediaQuery.of(context).size;
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            //  borderRadius: BorderRadius.circular(10),
            shape: BoxShape.circle),
      ),
      Align(alignment: Alignment.center,child: Image.asset(model.image,)),
      SizedBox(height: size.height*0.05,),
      Text(
        model.title,
        style: Theme.of(context).textTheme.headline1,
      ),
      SizedBox(
        height: 1.sp,
      ),
      Text(
        model.subTitle,
        style: Theme.of(context).textTheme.caption,
      )
    ],
  );
}
