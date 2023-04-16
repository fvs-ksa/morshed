import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: Stack(
            children: [
              Container(
                height: screenSize.height * 0.2,
                child: Center(child: Text('الحساب',style: Theme.of(context).textTheme.headline2,)),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(top: screenSize.width*0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: whiteColor,child: SvgPicture.asset('assets/svg/dropdown-1.svg'),),
                    SizedBox(height: screenSize.height*0.05,),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.03),
                      child: CircleAvatar(backgroundColor: darkMainColor,child: Image.asset('assets/images/profile.png'),
                      radius: screenSize.height*0.05,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          preferredSize: Size.fromHeight(screenSize.height * 0.25)),
      body: Padding(
        padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.03,end: screenSize.width*0.03),
        child: Column(
          children: [
            textFormField(labelText: 'الاسم بالكامل بالعربي حسب الجواز', hintText: '', context: context,),
            textFormField(labelText: 'الاسم بالكامل بالانجليزي حسب الجواز', hintText: 'hintText', context: context),
            textFormField(labelText: 'رقم الجوال', hintText: 'hintText', context: context,keyboardType: TextInputType.number),
            textFormField(labelText: 'تاريخ الميلاد', hintText: 'hintText', context: context),
            textFormField(labelText: 'البريد الألكتروني', hintText: 'hintText', context: context,keyboardType: TextInputType.emailAddress),
            textFormField(labelText: 'رقم الجواز', hintText: 'hintText', context: context),
            textFormField(labelText: 'رقم التأشيره', hintText: 'hintText', context: context),
            textFormField(labelText: 'اسم شركه العمره | الحمله', hintText: 'hintText', context: context),


          ],
        ),
      ),
    );
  }
}
