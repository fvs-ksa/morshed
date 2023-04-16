import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/chat_cubit/chat_with_support_cubit/chat_support_state.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/chat_cubit/chat_with_support_cubit/chat_support_cubit.dart';
import '../../component/const_color.dart';

class SupportScreen extends StatelessWidget {
  //const SupportScreen({Key? key}) : super(key: key);
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chatWithSupportCubit=ChatWithSupportCubit.get(context);
    Size screenSize = MediaQuery.of(context).size;
    return BlocConsumer<ChatWithSupportCubit,ChatWithSupportState>(
      listener: (context,state){},
      builder: (context,state) {
        return GestureDetector(
          onTap: (){ FocusManager.instance.primaryFocus?.unfocus();},
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  child: Container(
                    height:screenSize.height*0.15 ,
                    child: Center(child: Text('الدعم الفني',style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,)),
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: screenSize.height*0.67,
                    color: whiteGreyColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: ListView.separated(
                          shrinkWrap: true,
                          // physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width * 0.03,
                                    vertical: screenSize.height * 0.01),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(15.sp),
                                    topEnd: Radius.circular(15.sp),
                                    topStart: Radius.circular(15.sp),
                                  ),
                                ),
                                child: Text(
                                  chatWithSupportCubit.messages[index],
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: screenSize.height * 0.01,
                            );
                          },
                          itemCount: chatWithSupportCubit.messages.length),
                    ),
                  ),
                ),
                Container(
                  height:screenSize.height*0.15 ,
                  color: whiteGreyColor,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          top: screenSize.height*0.02,
                          start: screenSize.height * 0.02,
                          end: screenSize.height * 0.02,
                        ),
                        child: Card(
                          elevation: 3,
                          margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.sp)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                            height: screenSize.height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.sp),
                                color: whiteColor),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onTap: () {
                                      chatWithSupportCubit.arabicTextField(
                                          controller: messageController);
                                    },
                                    controller: messageController,
                                    style: Theme.of(context).textTheme.caption,
                                    decoration: InputDecoration(
                                        hintText: 'ارسل رساله',
                                        focusColor: greyColor,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: whiteColor),
                                          borderRadius: BorderRadius.circular(20.sp),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: whiteColor),
                                          borderRadius: BorderRadius.circular(20.sp),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(color: whiteColor),
                                          borderRadius: BorderRadius.circular(20.sp),
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    messageController.text.isEmpty
                                        ? debugPrint('galal')
                                        : chatWithSupportCubit
                                        .sendTextMessage(messageController.text);
                                    messageController.clear();
                                  },
                                  child: CircleAvatar(child: SvgPicture.asset('assets/svg/Icon ionic-ios-send.svg',)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Stack(
                //   alignment: Alignment.bottomCenter,
                //   children: [
                //
                //
                //   ],
                // ),


              ],
            ),
          ),
        );
      }
    );
    // return Scaffold(
    //   appBar: PreferredSize(
    //       child: Center(
    //           child: Text(
    //             'الدعم الفني',
    //             style: Theme.of(context).textTheme.headline1,
    //             textAlign: TextAlign.center,
    //           )),
    //       preferredSize: Size.fromHeight(screenSize.height * 0.15)),
    //   body: SingleChildScrollView(
    //     physics: NeverScrollableScrollPhysics(),
    //     child: Column(
    //       children: [
    //         Divider(),
    //         Container(
    //           height: screenSize.height*0.70,
    //           child: ListView.separated(itemBuilder: (context,index){
    //             return Container(
    //               padding: EdgeInsetsDirectional.only(start: screenSize.width*0.03,top: screenSize.height*0.02,end: screenSize.width*0.03),
    //               height: screenSize.height * 0.11,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       SvgPicture.asset('assets/svg/Icon ionic-ios-send.svg',),
    //                       SizedBox(width: screenSize.width*0.01,),
    //                       Text(
    //                         'تم ايجاد مرشد لك',
    //                         style: Theme.of(context).textTheme.bodyText2,
    //                       ),
    //                       Spacer(),
    //                       Text(
    //                         '15/12/2023',
    //                         style: Theme.of(context).textTheme.subtitle1,
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(height: screenSize.height*0.012,),
    //                   Text('تم ايجاد مرشد لك خاص ببلاغ #1245',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.start,),
    //                 ],
    //               ),
    //             );
    //           }, separatorBuilder: (context,index){return Divider(endIndent: screenSize.width*0.02,indent: screenSize.width*0.02,);}, itemCount: 15),
    //         )
    //
    //       ],
    //     ),
    //   ),
    //
    // );
  }
}
