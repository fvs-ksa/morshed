import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/translation/locale_keys.g.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenSize.longestSide,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/qr code bg.png',
                  ),
                  fit: BoxFit.fitWidth)),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: screenSize.height * 0.1),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenSize.width * 0.09,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                'محمد أحمد',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                LocaleKeys.provideYourCodeToAssistYou.tr(),
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Container(
                height: screenSize.height*0.3,
                width: screenSize.width*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: whiteColor,),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/qrCode.png'),)),
                //child: Image.asset('assets/images/qrCode.png')
              )
            ],
          ),
        )
      ],
    );
  }
}
