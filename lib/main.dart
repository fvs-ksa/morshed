import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/chat_cubit/chat_with_support_cubit/chat_support_cubit.dart';
import 'package:morshed/bloc/general_cubit/general_cubit.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/setting_cubit/cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/pallete.dart';
import 'package:morshed/screen/borading_screen/boarding_screen.dart';
import 'package:morshed/translation/codegen_loader.g.dart';
import 'package:morshed/utiels/navigation_Services.dart';
import 'package:sizer/sizer.dart';
import 'bloc_observe.dart';
import 'constant/text_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/langs',
      assetLoader: const CodegenLoader(),
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
          BlocProvider<BoardingCubit>(
              create: (context) => BoardingCubit()..initialization()),
          BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
          BlocProvider<GeneralCubit>(create: (context) => GeneralCubit()),
          BlocProvider<ChatWithSupportCubit>(
              create: (context) => ChatWithSupportCubit()),
          BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
          BlocProvider<SettingCubit>(create: (context) => SettingCubit()),
          BlocProvider<SubmitReportCubit>(
              create: (context) => SubmitReportCubit()),
          BlocProvider<AccountTypeCubit>(
              create: (context) => AccountTypeCubit()),
        ],
        child: MediaQuery(
          data: const MediaQueryData(),
          child: Sizer(builder: (ctx, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavigationService.navigate().navigationKey,
              debugShowCheckedModeBanner: false,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              title: 'مرشد',
              theme: ThemeData(
                primarySwatch: Palette.primaryColor,
                textTheme: responsiveTextTheme(ctx),
              ),
              home: BoardingScreen(),
            );
          }),
        ));
  }
}
// TextTheme(
//
// headline1: GoogleFonts.cairo(
// color: blackColor,
// fontSize: 20*scaleFactor,
// fontWeight: FontWeight.bold,
// ),
// caption: GoogleFonts.cairo(
// fontSize: 14*scaleFactor,
// color: greyColor,
//
// fontWeight: FontWeight.w400,
// // fontFamily: 'Cairo-Regular'
// ),
// subtitle1: GoogleFonts.cairo(
// fontSize: 13*scaleFactor,
// color: whiteGreyColor,
// fontWeight: FontWeight.w500,
// // fontFamily: 'Cairo-Regular'
// ),
// headline2: GoogleFonts.cairo(
// color: whiteColor,
// fontWeight: FontWeight.bold,
// fontSize: 19*scaleFactor,
// // fontFamily: 'Cairo-Bold'
// ),
// bodyText1: GoogleFonts.cairo(
// fontSize: 15*scaleFactor,
// color: darkMainColor,
// fontWeight: FontWeight.w700,
// // fontFamily: 'Cairo-Medium'
// ),
// bodyText2: GoogleFonts.cairo(
// fontSize: 14*scaleFactor,
// color: blackColor,
// fontWeight: FontWeight.w800,
// //fontFamily: 'cairo-Black'
// ),
// headline5:  GoogleFonts.cairo(
// color: blackColor,
// fontWeight: FontWeight.normal,
// fontSize: 14*scaleFactor,
// //fontFamily: 'cairo-Black'
// ),
// headlineLarge:GoogleFonts.cairo(
// color: blackColor,
// fontWeight: FontWeight.normal,
// fontSize: 10*scaleFactor,
// //fontFamily: 'cairo-Black'
// ),
// overline: GoogleFonts.cairo(
// color: greyColor,
// fontWeight: FontWeight.w400,
// fontSize: 10*scaleFactor,
// // fontFamily: 'Cairo-Regular'
// ),
// subtitle2:GoogleFonts.cairo(
// color: blackColor,
// fontWeight: FontWeight.w700,
// fontSize: 13*scaleFactor,
// // fontFamily: 'Cairo-Medium'
// ) ,
// headline6: GoogleFonts.cairo(
// color: orangeColor,
//
// fontWeight: FontWeight.w500,
// fontSize: 15*scaleFactor,
// // fontFamily: 'Cairo-Medium'
// ),
// headline4: GoogleFonts.cairo(color: orangeColor,fontWeight: FontWeight.w700,fontSize: 18*scaleFactor,decoration: TextDecoration.underline),
// headline3: GoogleFonts.cairo(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 15*scaleFactor),
// button: GoogleFonts.cairo(color: whiteColor,fontSize: 15*scaleFactor,fontWeight: FontWeight.w700)
// )
