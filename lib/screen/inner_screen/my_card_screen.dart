import 'package:flutter/material.dart';

import '../../component/guide_escorts_component.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: preferredHeaderWithGuide(
          context: context, title: 'بطاقتي', isActive: false),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: screenSize.height*0.04),
            // height: screenSize.height*0.2,
            // width: double.infinity,
            child: Center(child: Image.asset('assets/images/card.png',fit: BoxFit.cover,width: double.infinity,)),
          ),
        ],
      ),
    );

  }
}
