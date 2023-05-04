import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../constant/const_color.dart';
import '../../component/floating_Container.dart';

class EscortsScreen extends StatelessWidget {
  TextEditingController searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(context: context, title:LocaleKeys.Companions.tr(), fct: (){},searchController:searchController,isGuide: false ),
      backgroundColor: whiteGreyColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: screenSize.height * 0.01,
            start: screenSize.width * 0.02,
            end: screenSize.width * 0.02),
        child: Stack(
          children: [
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return itemContainerOfGuidesAndEscorts(
                      context: context,
                      image: 'assets/images/profile.png',
                      name: 'أحمد محمد',
                      phone: '0506977241',
                  );
                }),
            Padding(
              padding:EdgeInsetsDirectional.only(bottom: screenSize.height*0.02,start: screenSize.width*0.02),
              child: floatingContainer(
                  alignment: AlignmentDirectional.bottomEnd,
                  context: context, svgAssets: 'assets/svg/Icon ionic-ios-add.svg',
                  title: LocaleKeys.Companions.tr(), width: screenSize.width * 0.33,color:darkMainColor ),
            ),
          ],
        ),
      ),

    );
    
  }
}
