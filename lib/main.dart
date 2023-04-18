import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/chat_cubit/chat_with_support_cubit/chat_support_cubit.dart';
import 'package:morshed/bloc/general_cubit/general_cubit.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/setting_cubit/cubit.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/pallete.dart';
import 'package:morshed/screen/borading_screen/boarding_screen.dart';
import 'package:morshed/utiels/navigation_Services.dart';
import 'package:sizer/sizer.dart';

import 'bloc_observe.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   Bloc.observer=MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('ar'),
        Locale('en')],
      path: 'assets/langs',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BoardingCubit>(create: (context) => BoardingCubit()..initialization()),
          BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
          BlocProvider<GeneralCubit>(create: (context) => GeneralCubit()),
          BlocProvider<ChatWithSupportCubit>(create: (context) => ChatWithSupportCubit()),
          BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
          BlocProvider<SettingCubit>(create: (context) => SettingCubit()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavigationService.navigate().navigationKey,
              debugShowCheckedModeBanner: false,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              title: 'مرشد',

              theme: ThemeData(
                primarySwatch: Palette.primaryColor,

                textTheme: TextTheme(
                  headline1: TextStyle(
                    color: blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo-Bold'
                  ),
                  caption: TextStyle(
                    color: greyColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Cairo-Regular'
                  ),
                  subtitle1: TextStyle(
                  color: whiteGreyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                      fontFamily: 'Cairo-Regular'
                ),
                  headline2: TextStyle(
                    color: whiteColor,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo-Bold'
                  ),
                  bodyText1: TextStyle(
                    color: darkMainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo-Medium'
                  ),
                    bodyText2: TextStyle(
                        color: blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'cairo-Black'
                ),
                  headline5:  TextStyle(
                    color: blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'cairo-Black'
                ),
                  headline6: TextStyle(
                      color: orangeColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo-Medium'
                  ),
                  headline4: TextStyle(color: orangeColor,fontWeight: FontWeight.w800,fontSize: 20.sp,decoration: TextDecoration.underline),
                  headline3: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 15.sp),
                  button: TextStyle(color: whiteColor,fontSize: 15.sp,fontWeight: FontWeight.w700)
                  // headline3: TextStyle(
                  //     color: lightMainColor,
                  //     fontSize: 15.sp,
                  //     fontWeight: FontWeight.w500
                  // ),
                ),
                fontFamily: 'cairo-Black',
              ),
              home: BoardingScreen(),
            );
          }
        ));
  }
}
