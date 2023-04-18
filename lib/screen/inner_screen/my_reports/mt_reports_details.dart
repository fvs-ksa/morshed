import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';

import '../../../component/const_color.dart';
import '../../../component/guide_escorts_component.dart';

class MyReportsDetailsScreen extends StatelessWidget {
  int index;

  MyReportsDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context, title: 'تفاصيل البلاغ', isActive: false),
      body: GestureDetector(
        onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: screenSize.height * 0.07,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(index == 0
                                ? 'assets/images/Group 204366.png'
                                : index == 1
                                    ? 'assets/images/Group 204365.png'
                                    : 'assets/images/Group 204367.png'),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    index == 0
                        ? 'تحت المعالجه'
                        : index == 1
                            ? 'المرشد في الطريق'
                            : 'تمت المعالجه',
                    style: index == 2
                        ? Theme.of(context).textTheme.bodyText1
                        : Theme.of(context).textTheme.button,
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04,vertical: screenSize.height*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height*0.05,),
                    textFormField(labelText: 'رقم الجواز',  context: context,isEnabled: false),
                    textFormField(labelText: 'موقع البلاغ',  context: context,isEnabled: false),
                    SizedBox(
                      height: screenSize.height*0.17,
                     // color: Colors.red,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Padding(
                            padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.03),
                            child: textFormField(labelText: 'ملاحظات',  context: context,lines: 5,isEnabled: false),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(end: screenSize.height*0.05),
                            child: CircleAvatar(
                              radius: screenSize.width*0.07,
                              backgroundColor: babyBlueColor,child: SvgPicture.asset('assets/svg/file (1).svg'),),
                          )
                        ],
                      ),
                    ),
                    //SizedBox(height: screenSize.height*0.06,),
                    Text('كيف يمكننا مساعدتك؟',style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: screenSize.height*0.01,),
                    Text('اود المساعده للوصول الي الفندق',style: Theme.of(context).textTheme.bodyText2,),
                    index==0?Align(alignment: AlignmentDirectional.center,child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: screenSize.height*0.06,horizontal: screenSize.width*0.03),
                      child: mainButton(width: screenSize.width*0.8, height: screenSize.height*0.08, text: 'الغاء البلاغ', color: orangeColor, context: context, fct: (){}),
                    )):const SizedBox()
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}