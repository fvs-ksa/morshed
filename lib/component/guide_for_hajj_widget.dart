import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info_profile_component.dart';

PreferredSize headerForHijGuides({required BuildContext context,required String title,required String image}){
  Size screenSize=MediaQuery.of(context).size;
  return PreferredSize(child: Container(
    height: screenSize.height*0.25,
    child: Stack(
      children: [
        Container(height: screenSize.height*0.17,
          child: Align(alignment: AlignmentDirectional.centerStart,child: backButtonWidget(fct: ()=>Navigator.pop(context)),),
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),),

        Container(
          margin: EdgeInsetsDirectional.only(top: screenSize.height*0.12),
          height: screenSize.height*0.1,

          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

            child: Align(
              alignment: AlignmentDirectional.center,
              child: ListTile(
                title: Text(title,style: Theme.of(context).textTheme.bodyText2,),
                leading: Image.asset(image),),
            ),
          ),
        )
      ],),
  ), preferredSize: Size.fromHeight(screenSize.height*0.2));
}