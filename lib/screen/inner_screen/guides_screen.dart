import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/component/info_profile_component.dart';

import '../../component/const_color.dart';

class GuidesScreen extends StatelessWidget {
TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context,
          title: 'المرشدين',
        searchController:searchController ,
        fct: (){}
          ),
      backgroundColor: whiteGreyColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: screenSize.height * 0.01,
            start: screenSize.width * 0.02,
            end: screenSize.width * 0.02),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return itemContainerOfGuidesAndEscorts(
                  context: context,
                  image: 'assets/images/profile.png',
                  name: 'احمد محمد',
                  phone: '0506977241',
                  contactColumn: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      circleAvtarWidget(svgImage: 'assets/svg/end call.svg'),
                      circleAvtarWidget(svgImage: 'assets/svg/msg.svg')
                    ],
                  ));
            }),
      ),
    );
  }
}
