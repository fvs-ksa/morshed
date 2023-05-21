import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/chat_cubit/chat_with_support_cubit/chat_support_cubit.dart';
import 'package:morshed/bloc/general_cubit/general_cubit.dart';
import 'package:morshed/bloc/guides_cubit/cubit.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/setting_cubit/cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/pallete.dart';
import 'package:morshed/screen/borading_screen/boarding_screen.dart';
import 'package:morshed/translation/codegen_loader.g.dart';
import 'package:morshed/utiels/navigation_Services.dart';
import 'package:morshed/utiels/shared_pref.dart';
import 'bloc/add_companions_cubit/cubit.dart';
import 'bloc_observe.dart';
import 'constant/const_color.dart';
import 'constant/text_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  ///CacheHelper.getData(key: 'isEnglish');
  runApp(DevicePreview(
    enabled: false,
    builder:(context)=> EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/langs',
        assetLoader: const CodegenLoader(),
        startLocale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    myLocale = EasyLocalization.of(context)?.currentLocale;
    print('my locale ${myLocale}');
    isEnglish = CacheHelper.getData(key: 'isEnglish') ?? false;
    return MediaQuery(
      data: const MediaQueryData(),
      child: MultiBlocProvider(
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
            BlocProvider<AddCompanionsCubit>(
              create: (context) => AddCompanionsCubit(),
            ),
            BlocProvider<GuidesCubit>(create: (context) => GuidesCubit()),
          ],
        child:ScreenUtilInit(

            designSize: Size(414,896),
           // useInheritedMediaQuery: true,
              builder: (context , child) {
                return MaterialApp(
                  navigatorKey: NavigationService.navigate().navigationKey,
                  debugShowCheckedModeBanner: false,
                // locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  title: 'مرشد',
                  theme: ThemeData(
                    primarySwatch: Palette.primaryColor,
                    textTheme: responsiveTextTheme(context),
                  ),
                  home: BoardingScreen(),
                );
              }
            ),
      ),
    );
  }
}
