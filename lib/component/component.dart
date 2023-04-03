import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/models/account_type_model.dart';
import 'package:sizer/sizer.dart';

import '../utiels/navigation_Services.dart';

Widget floatingButton({
  required BuildContext context,
  required Function fct,
  Color? backgroundColor,
  Color? iconColor,
}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      fct();
    },
    child: Container(
      height: size.height * 0.15,
      width: size.width * 0.15,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: backgroundColor ?? darkMainColor),
      child: Icon(
        Icons.arrow_forward,
        color: iconColor ?? whiteColor,
      ),
      // onPressed: () {},
      // backgroundColor: Colors.cyanAccent,
    ),
  );
}

Widget accountType(
    {required BuildContext context, required AccountTypeModel model,required Function fct}) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsetsDirectional.only(start: size.width * 0.12),
    child: Column(
      children: [
        Container(
          height: size.height * 0.23,
          width: size.width * .32,
          padding: EdgeInsetsDirectional.only(start:size.width * 0.05,end:size.width * 0.05,top: size.height*0.03 ,bottom: size.height*0.03),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: lightMainColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(model.image, height: size.height * 0.11,width:size.width * .28 ,fit: BoxFit.contain,)),
              Text(
                model.name,
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
        Checkbox(
          value: model.isTabbed, onChanged: (onChanged) {
            fct(onChanged);
        },
          activeColor: whiteColor,
          //checkColor: whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
        )
      ],
    ),
  );
}

navigateForward(Widget page, {arguments}) {
  NavigationService.navigate().navigateToScreen(page, arguments: arguments);
}

navigateForwardReplace(Widget page, {arguments}) {
  NavigationService.navigate().replaceScreen(page, arguments: arguments);
}

navigateForwardPop(Widget page, {arguments}) {
  NavigationService.navigate().goBack(page);
}
Widget textFormField(
    {required String labelText,
    required String hintText,
      required BuildContext context,
     TextEditingController? controller,
      TextInputType? keyboardType,
      Widget? suffixIcon,
      bool isEnabled=true,
    Function? validator}){
  Size size=MediaQuery.of(context).size;
  return Padding(
    padding:  EdgeInsets.only(bottom:size.height*0.02 ),
    child: TextFormField(

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.sp))),
      controller: controller,
      validator: (val){
        validator!();
        return null;
      },
      keyboardType: keyboardType,
      enabled: isEnabled,
    ),
  );
}
Widget dropDownButton(
    {required List<DropdownMenuItem> items,
      required var value,
      required String hint,
      required Function fct,
      required BuildContext context,
      required Function validator}) {
  Size screenSize = MediaQuery.of(context).size;
  return Align(
    alignment: AlignmentDirectional.topStart,
    child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: screenSize.height*0.02,top: screenSize.height*0.02),
        child: Container(

            padding: EdgeInsets.only(right: 5.w, left: 5.w),
            height: screenSize.height * 0.08,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20.sp),
                border: Border.all(color: greyColor)),
            child: Row(
              children: [
                Expanded(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      //  hint: Text('اختيار نوع '),
                      isExpanded: true,
                      decoration: const InputDecoration(border: InputBorder.none),
                      //underline: SizedBox(),
                      hint: Text(hint),
                      iconSize: 0.0,
                      // hint: Text('ggg'),
                      borderRadius: BorderRadius.circular(12.sp),
                      value: value,

                      items: items,
                      onChanged: (v) {
                        fct(v);
                      },
                      validator: (v) {
                        return validator(v);
                      },
                    ),
                  ),
                ),
                SvgPicture.asset('assets/svg/dropdown.svg')
              ],
            ))),
  );
}
Widget mainButton(
    {required double width,
      required double height,
      FontWeight? fontWeight,
      required String text,
      required Color color,
      // TextStyle? textStyle,
      required BuildContext context,
      required Function fct}) {
  return InkWell(
    onTap: () {
      fct();
    },
    child: Container(
      height: height,
      width: width,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(35.sp)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    ),
  );
}