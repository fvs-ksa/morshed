import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';
import 'package:sizer/sizer.dart';

import '../../component/const_color.dart';
import '../../component/navigation_functions.dart';
import '../bottom_navigations_screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04),
            height: screenSize.height*0.15,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  backButtonWidget(fct: (){Navigator.pop(context);}),
                  Text('دخول الآن',style: Theme.of(context).textTheme.headline1,),
                ],
              ),
              Image.asset('assets/images/مرشد.png',height: screenSize.height * 0.2,
                width: screenSize.width * 0.3,),
            ],
          ),
          )),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.08,vertical: screenSize.height*0.04),
            child: Column(
              children: [
                textFormField(labelText: 'اسم المستخدم', context: context,controller: userNameController),
                textFormField(labelText: 'كلمه المرور', context: context,controller: passwordNameController,suffixIcon: Icon(Icons.visibility)),
                SizedBox(height: screenSize.height*0.07,),
                mainButton(width: double.infinity, height: screenSize.height*0.07, text: 'دخول الآن', color: darkMainColor, context: context, fct: (){
                  navigateForward(MainScreen());
                }),
                SizedBox(height: screenSize.height*0.02,),
                richText(navigation:()=> navigateForward(RegisterScreen()), text: 'ليس لديك حساب؟  ', tappedText: 'سجل الآن', context: context),
                SizedBox(height: screenSize.height*0.02,),
                Text('الدخول كزائر',style: TextStyle(color: darkMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Spacer(),
          TextButton(onPressed: (){
            showDialog(
                useSafeArea: false,
                
                context: context, builder: (context){
              return AlertDialog(

                title: Text('التواصل السريع',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الإتصال الموحد',style: Theme.of(context).textTheme.headline5,),
                    GestureDetector(onTap: (){launchWhatsapp(context);},child: textFormField(labelText: '966506977241+', context: context,isEnabled: false)),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/Icon ionic-logo-whatsapp.svg'),
                        SizedBox(width: screenSize.width*0.03,),
                        Text('واتساب مرشد يحولك للدردشة مباشرة',style: Theme.of(context).textTheme.headline5,),

                      ],
                    ),
                    SizedBox(height: screenSize.height*0.03,)
                  ],
                ),
              );
            });

          },child: Text('الدخول السريع',style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,)),
          Image.asset('assets/images/pattern2.png',fit: BoxFit.contain,)
        ],
      ),
    );
  }
}
