
import 'package:flutter/material.dart';

homeComponentWidget({required BuildContext context,required String image,required String title,TextStyle?style,required Function fct,bool isWide=true,bool isTall=true}){
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: (){fct();},
    child: Container(
      height:isTall?size.height * 0.17: size.height * 0.15,
      width:isWide? size.width * 0.25: size.width * 0.2,
      child: Column(
        children: [
          Image.asset(image,width:size.width * 0.2 ,),
          Text(
            title,
            style: style??Theme.of(context).textTheme.bodyText2,
             softWrap: true,
            textAlign: TextAlign.center,
             overflow: TextOverflow.clip,
          )
        ],
      ),
    ),
  );
}
