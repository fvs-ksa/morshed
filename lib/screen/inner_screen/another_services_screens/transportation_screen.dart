import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/component/info_profile_component.dart';
import '../../../translation/locale_keys.g.dart';

class TransportationScreen extends StatelessWidget {
  const TransportationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerInfoPerson(
          context: context,
          title: LocaleKeys.transports.tr(),
          avatarChild: Image.asset('assets/images/trasportation.png'),
          isProfile: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.w),
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                        'assets/images/taxi.png',
                        height: 60.03.h,
                        width: 68.53.w,
                      )),
                      Text(
                        LocaleKeys.maccaTransports.tr(),
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
