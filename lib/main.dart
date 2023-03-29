import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/component/const_color.dart';
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
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavigationService.navigate().navigationKey,
              debugShowCheckedModeBanner: false,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: TextTheme(
                  headline1: TextStyle(
                    color: blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  caption: TextStyle(
                    color: greyColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  headline2: TextStyle(
                    color: whiteColor,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              home: BoardingScreen(),
            );
          }
        ));
  }
}
