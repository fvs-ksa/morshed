import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/translation/locale_keys.g.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 3,
            child: Container(
              height:148.h ,
              padding: EdgeInsetsDirectional.only(top: 30.h),
              child: Center(child: Text(LocaleKeys.notifications.tr(),style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,)),
            ),
          ),
          //Divider(),
          Expanded(

            child: ListView.separated(
                padding: EdgeInsetsDirectional.only(top: 10.h),
                itemBuilder: (context,index){
              return Container(
                padding: EdgeInsetsDirectional.only(start:20.w,end: 5.h),
                height: 86.5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/notifications.svg',),
                        SizedBox(width:10.w,),
                        Text(
                          'تم ايجاد مرشد لك',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                        Text(
                          '15/12/2023',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text('تم ايجاد مرشد لك خاص ببلاغ #1245',style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.start,),
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
