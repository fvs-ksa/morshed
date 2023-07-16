import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morshed/bloc/login_cubit/login_cubit.dart';
import 'package:morshed/bloc/login_cubit/login_state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/auth_header_widget.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/cutom_text_filed.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';

import '../../constant/const_color.dart';
import '../../component/navigation_functions.dart';
import '../../translation/locale_keys.g.dart';
import '../bottom_navigations_screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var loginCubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){},
      builder: (context,state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar:
                headerAuthScreen(context: context, title: LocaleKeys.loginNow.tr()),
            body: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 40.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          labelText: LocaleKeys.userName.tr(),

                          keyboardType: TextInputType.emailAddress,
                          // validator: (String val){
                          //   if(val.isEmpty){
                          //     return 'برجاء ادخال اسم المستخدم';
                          //   }
                          // },
                          controller: userNameController),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                          labelText: LocaleKeys.password.tr(),

                          // validator: (String val){
                          //   if(val.isEmpty){
                          //     return 'برجاء ادخال الرقم السري';
                          //   }
                          // },
                          secure: loginCubit.isVisable,
                          controller: passwordController,
                          suffixIcon:  IconButton(onPressed: () {loginCubit.changeVisabilityState() ; },
                            icon: loginCubit.isVisable?Icon(Icons.visibility_off):Icon(Icons.visibility),)),
                      SizedBox(
                        height: 70.h,
                      ),
                      state is LoginLoadingState ? CircularProgressIndicator(): mainButton(
                          text:LocaleKeys.loginNow.tr(),
                          color: darkMainColor,
                          context: context,
                          fct: () {
                            if(_formKey.currentState!.validate()){
                              loginCubit.userLogin(email: userNameController.text, password: passwordController.text);
                            }


                          }),
                      SizedBox(
                        height: 40.h,
                      ),
                      richText(
                          navigation: () => navigateForward(RegisterScreen()),
                          text: LocaleKeys.notHaveAnAccount.tr(),
                          tappedText: LocaleKeys.registerNow.tr(),
                          context: context),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Text(
                      //   LocaleKeys.signAsGuest.tr(),
                      //   style: GoogleFonts.cairo(
                      //       fontSize: 17.sp,
                      //       color: darkMainColor,
                      //       decoration: TextDecoration.underline,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/pattern2.png',
                  fit: BoxFit.contain,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                LocaleKeys.FastCommunication.tr(),
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.unifiedCommunications.tr(),
                                    style: GoogleFonts.cairo(
                                        fontSize: 14.sp,
                                        color: blackColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        launchCall(context: context,phoneNumber: '+966501342728');
                                      },
                                      child: CustomTextField(
                                          labelText: '+966501342728',
                                          isEnabled: false)),
                                  InkWell(
                                    onTap: () {
                                      launchWhatsapp(context);
                                    },
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/Icon ionic-logo-whatsapp.svg'),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            LocaleKeys.communicationWhatsApp.tr(),
                                            style: GoogleFonts.cairo(
                                                fontSize: 14.sp,
                                                color: blackColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.w,
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      LocaleKeys.FastCommunication.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        );
      }
    );
  }
}
