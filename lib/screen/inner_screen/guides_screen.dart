import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/info_profile_component.dart';

import '../../component/const_color.dart';

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(context: context, title: 'المرشدين', rowWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: textFormField(
                  labelText: 'بحث بالأسم أو رقم الجوال',
                  hintText: 'بحث بالأسم أو رقم الجوال',
                  context: context)),
          SizedBox(
            width: screenSize.width * 0.02,
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: screenSize.height * 0.01),
              child: mainButton(
                  width: screenSize.width * 0.2,
                  height: screenSize.height * 0.06,
                  text: 'بحث',
                  color: darkMainColor,
                  context: context,
                  fct: () {}))
        ],
      )),
      backgroundColor: whiteGreyColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: screenSize.height * 0.01,
            start: screenSize.width * 0.02,
            end: screenSize.width * 0.02),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsetsDirectional.only(
                    bottom: screenSize.height * 0.01),
                padding:
                    EdgeInsetsDirectional.only(end: screenSize.width * 0.02),
                height: screenSize.height * 0.15,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.04)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'محمد احمد',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                              text: 'رقم الجوال : ',
                              style: Theme.of(context).textTheme.caption,
                              children: [
                                TextSpan(
                                    text: '0506977241',
                                    style:
                                        Theme.of(context).textTheme.headline5)
                              ]),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: darkMainColor,
                          child: Image.asset('assets/images/profile.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                        circleAvtarWidget(svgImage: 'assets/svg/msg.svg')

                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
