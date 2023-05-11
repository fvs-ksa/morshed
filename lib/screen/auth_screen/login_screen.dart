import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/auth_header_widget.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';

import '../../constant/const_color.dart';
import '../../component/navigation_functions.dart';
import '../../translation/locale_keys.g.dart';
import '../bottom_navigations_screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double baseFontSize = screenSize.width < 600 ? 14 : 16;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar:
            headerAuthScreen(context: context, title: LocaleKeys.loginNow.tr()),
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 40.w,
              vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                textFormField(
                    labelText: LocaleKeys.userName.tr(),
                    context: context,
                    controller: userNameController),
                textFormField(
                    labelText: LocaleKeys.password.tr(),
                    context: context,
                    controller: passwordNameController,
                    suffixIcon: const Icon(Icons.visibility)),
                                SizedBox(
                  height:70.h,
                ),
                mainButton(
                    // width: double.infinity,
                    // height: screenSize.height * 0.07,
                    text: LocaleKeys.loginNow.tr(),
                    color: darkMainColor,
                    context: context,
                    fct: () {
                      navigateForward(MainScreen());
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
                                Text(
                  LocaleKeys.signAsGuest.tr(),
                  style: GoogleFonts.cairo(
                      fontSize: baseFontSize * 1.4,
                      color: darkMainColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),

              ],
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
                                style:
                                Theme.of(context).textTheme.headlineSmall,
                              ),
                              InkWell(
                                  onTap: () {
                                    launchCall(context);
                                  },
                                  child: textFormField(
                                      labelText: '966506977241',
                                      context: context,
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
                                        width: screenSize.width * 0.03,
                                      ),
                                      Text(
                                        LocaleKeys.communicationWhatsApp.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.03,
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
}




//                 Spacer(),
//