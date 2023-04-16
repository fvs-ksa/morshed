import 'package:flutter/material.dart';
import 'package:morshed/component/const_color.dart';

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
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                'قم باظهار رمز الكود الخاص بك لأي مرشد أو مكتب ارشادي لمساعدتك',
                style: Theme.of(context).textTheme.headline2,
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
                    image: DecorationImage(
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
