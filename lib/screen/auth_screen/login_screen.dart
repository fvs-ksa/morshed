import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';
import 'package:sizer/sizer.dart';

import '../../constant/const_color.dart';
import '../../component/navigation_functions.dart';
import '../../translation/locale_keys.g.dart';
import '../bottom_navigations_screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    double baseFontSize = screenSize.width < 600 ? 14 : 16;
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
                  Text(LocaleKeys.loginNow.tr(),style: Theme.of(context).textTheme.displayLarge,),
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
                textFormField(labelText:LocaleKeys.userName.tr(), context: context,controller: userNameController),
                textFormField(labelText:LocaleKeys.password.tr(), context: context,controller: passwordNameController,
                    suffixIcon: Icon(Icons.visibility)),
                SizedBox(height: screenSize.height*0.07,),
                mainButton(width: double.infinity, height: screenSize.height*0.07,
                    text:LocaleKeys.loginNow.tr(), color: darkMainColor, context: context, fct: (){
                  navigateForward(MainScreen());
                }),
                SizedBox(height: screenSize.height*0.02,),
                richText(navigation:()=> navigateForward(RegisterScreen()), text:LocaleKeys.notHaveAnAccount.tr(), tappedText:LocaleKeys.registerNow.tr(), context: context),
                SizedBox(height: screenSize.height*0.02,),
                Text(LocaleKeys.signAsGuest.tr(),style: GoogleFonts.cairo(
                    fontSize:baseFontSize*1.4 ,
                    color: darkMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Spacer(),
          TextButton(onPressed: (){
            showDialog(
                useSafeArea: false,
                
                context: context, builder: (context){
              return AlertDialog(

                title: Text(LocaleKeys.FastCommunication.tr(),style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.unifiedCommunications.tr(),style: Theme.of(context).textTheme.headlineSmall,),
                    GestureDetector(onTap: (){launchWhatsapp(context);},child: textFormField(
                        labelText: '966506977241+', context: context,isEnabled: false)),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/Icon ionic-logo-whatsapp.svg'),
                        SizedBox(width: screenSize.width*0.03,),
                        Text(LocaleKeys.communicationWhatsApp.tr(),style: Theme.of(context).textTheme.headlineSmall,),

                      ],
                    ),
                    SizedBox(height: screenSize.height*0.03,)
                  ],
                ),
              );
            });

          },child: Text(LocaleKeys.FastCommunication.tr(),style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
          Image.asset('assets/images/pattern2.png',fit: BoxFit.contain,)
        ],
      ),
    );
  }
}
