import 'package:flutter/material.dart';
import 'package:morshed/constant/const_color.dart';

homeComponentWidget({required BuildContext context,required String image,required String title,TextStyle?style,required Function fct,bool isWide=true,bool isTall=true}){
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: (){fct();},
    child: Container(
      height:isTall?size.height * 0.17: size.height * 0.15,
      width:isWide? size.width * 0.3: size.width * 0.23,
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
