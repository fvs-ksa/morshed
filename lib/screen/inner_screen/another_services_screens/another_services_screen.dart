import 'package:flutter/material.dart';
import 'package:morshed/component/const_color.dart';

import '../../../component/another_services_widget.dart';
import '../../../component/info_profile_component.dart';
import '../../../models/another_services_model.dart';

class AnotherServicesScreen extends StatelessWidget {
  const AnotherServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteGreyColor,
      appBar: headerAnotherServices(context: context, title: 'خدمات اخرى'),
      body: ListView.builder(
          itemCount: anotherServicesList.length,
          itemBuilder: (context,index){
        return  GestureDetector(
          onTap: ()=>anotherServicesList[index].fct(),
          child: Container(
            height: screenSize.height*0.13,
            margin: EdgeInsetsDirectional.only(start: screenSize.width*0.03,end:screenSize.width*0.03 ,top: screenSize.height*0.03),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15)),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: ListTile(
                title: Text(anotherServicesList[index].title,style: Theme.of(context).textTheme.bodyText2,),
                leading: Image.asset(anotherServicesList[index].image),),
            ),
          ),
        );
      }),
    );
  }
}
