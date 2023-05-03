import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            child: Container(
              height:size.height*0.15 ,
              padding: EdgeInsetsDirectional.only(top: size.height*0.02),
              child: Center(child: Text('الاشعارات',style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,)),
            ),
          ),
          //Divider(),
          Expanded(
            child: ListView.separated(itemBuilder: (context,index){
              return Container(
                padding: EdgeInsetsDirectional.only(start: size.width*0.03,end: size.width*0.03),
                height: size.height * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/notifications.svg',),
                        SizedBox(width: size.width*0.01,),
                        Text(
                          'تم ايجاد مرشد لك',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Spacer(),
                        Text(
                          '15/12/2023',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.012,),
                    Text('تم ايجاد مرشد لك خاص ببلاغ #1245',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.start,),
                  ],
                ),
              );
            }, separatorBuilder: (context,index){return Divider(endIndent: size.width*0.02,indent: size.width*0.02,);}, itemCount: 15),
          )

        ],
      );
    //);
  }
}
