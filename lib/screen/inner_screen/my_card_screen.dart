import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../../component/guide_escorts_component.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context, title:LocaleKeys.myCard.tr(), isActive: false),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: screenSize.height*0.04),
            child: Center(child: Image.asset('assets/images/card.png',fit: BoxFit.cover,width: double.infinity,)),
          ),
        ],
      ),
    );

  }
}
