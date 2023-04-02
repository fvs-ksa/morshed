import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({Key? key}) : super(key: key);
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: size.height * 0.19,
              //color: lightMainColor,
              padding: EdgeInsetsDirectional.only(
                  top: size.height * 0.07,
                  start: size.width * 0.07,
                  end: size.width * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: SvgPicture.asset('assets/svg/dropdown-1.svg'),
                        ),
                      ),
                      Text(
                        'تسجيل حاج جديد',
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/images/مرشد.png',
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                  )
                ],
              ),
            ),
            Container(
              height: size.height*0.81,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: size.width * 0.07,
                      end: size.width * 0.07,
                      top: size.height * 0.05),
                  child: Column(
                    children: [
                      textFormField(
                          labelText: 'الاسم بالكامل بالعربي حسب الجواز',
                          hintText: 'الاسم بالكامل بالعربي حسب الجواز',
                          context: context,
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                          hintText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                          controller: arabicNameController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'صوره شخصية',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.sp,
                                backgroundColor: lightMainColor,
                                foregroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                              Image.asset(
                                'assets/images/camera.png',
                                height: size.height * 0.05,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            flex:1,
                            child: textFormField(
                                context: context,
                                labelText: 'رقم الجوال',
                                hintText: 'رقم الجوال',
                                controller: arabicNameController),
                          ),
                          SizedBox(width: size.width*0.07,),
                          Container(
                            height: size.height*0.05,
                            width: size.width*0.2,
                            child:Center(child: Text('+966',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,)),
                            decoration: BoxDecoration(
                                color: babyBlueColor,
                                borderRadius: BorderRadius.circular(35.sp)),
                          ),
                        ],
                      ),

                      textFormField(
                          context: context,
                          labelText: 'البريد الالكتروني',
                          hintText: 'البريد الالكتروني',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'رقم الجواز',
                          hintText: 'رقم الجواز',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'البريد الالكتروني',
                          hintText: 'البريد الالكتروني',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'رقم الجواز',
                          hintText: 'رقم الجواز',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'البريد الالكتروني',
                          hintText: 'البريد الالكتروني',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'رقم الجواز',
                          hintText: 'رقم الجواز',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'البريد الالكتروني',
                          hintText: 'البريد الالكتروني',
                          controller: arabicNameController),
                      textFormField(
                          context: context,
                          labelText: 'رقم الجواز',
                          hintText: 'رقم الجواز',
                          controller: arabicNameController),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
