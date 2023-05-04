import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:sizer/sizer.dart';

import '../../../translation/locale_keys.g.dart';

class TransportationScreen extends StatelessWidget {
  const TransportationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: headerInfoPerson(context: context, title:LocaleKeys.transports.tr(), avatarChild: Image.asset('assets/images/trasportation.png')
          ,isProfile: true),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.04),
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10

        ), itemBuilder: (context,index){
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
            elevation: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/images/taxi.png',height:screenSize.height*0.13 ,width: screenSize.width*0.25,)),
                  Text(LocaleKeys.maccaTransports.tr(),softWrap: true,)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
