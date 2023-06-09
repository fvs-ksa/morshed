import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../../component/guide_escorts_component.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerOfTechnicalSupport(
          context: context, title: LocaleKeys.myCard.tr()),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 16.h),
            child: Center(
                child: Image.asset(
              'assets/images/card.png',
              fit: BoxFit.cover,
              width: double.infinity,
            )),
          ),
        ],
      ),
    );
  }
}
