
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';

class NoInternetScreen extends StatelessWidget {
  final Widget child;
  NoInternetScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/NO_INTERNET.png', width: 150, height: 150),
            Text('حدث خطأ',style: Theme.of(context).textTheme.headlineSmall,),
            SizedBox(height: 20),
            Text(
              'لا يوجد اتصال بالانترنت',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 40),
            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: mainButton( text: 'اعاده المحاوله',
                color: darkMainColor,
                context: context,
                fct: () async {
                if(await Connectivity().checkConnectivity() != ConnectivityResult.none) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => child));
                }
              },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
