import 'package:flutter/material.dart';
import 'package:morshed/constant/const_color.dart';

homeComponentWidget({required BuildContext context,
  required String image,
  required String title,TextStyle?style,
  required Function fct,
  required double width,
  required double height,
  bool isWide=true,
  bool isTall=true}){
 Size size = MediaQuery.of(context).size;
  return GestureDetector(

    onTap: (){fct();},
    child: Container(
      padding: EdgeInsets.zero,
      height:height,
      width:width,
      child: Column(
        children: [
          Padding(
            padding:EdgeInsetsDirectional.only(bottom: size.height*0.01),
            child: Image.asset(image,width:size.width * 0.2 ,),
          ),
          FittedBox(
            child: Text(
              title,
              style: style??Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              // softWrap: true,
              textAlign:myLocale=='en'?TextAlign.start: TextAlign.center,
               overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    ),
  );
}
