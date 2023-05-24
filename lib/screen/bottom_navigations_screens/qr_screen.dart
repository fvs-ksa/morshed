import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/translation/locale_keys.g.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/qr code bg.png',
                  ),
                  fit: BoxFit.fitWidth)),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 80.h),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.sp,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'محمد أحمد',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                LocaleKeys.provideYourCodeToAssistYou.tr(),
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 29.h,
              ),
              Container(
                height: 258.h,
                width: 258.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(
                      color: whiteColor,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/qrCode.png'),
                    )),
                //child: Image.asset('assets/images/qrCode.png')
              )
            ],
          ),
        )
      ],
    );
  }
}
