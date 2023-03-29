
import 'package:flutter/material.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:sizer/sizer.dart';

import '../../models/account_type_model.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/qr code bg.png',
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: size.height * 0.1),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/whiteMorshed.png',
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'اختر صفه التسجيل',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  height: size.height * 0.4,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: typeModel.length,
                    itemBuilder: (context, index) {
                      return accountType(
                          context: context, model: typeModel[index]);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return CustomPaint(
                          size: Size(1, double.infinity),
                          painter: DashedLineVerticalPainter(),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = whiteColor
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY = dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}