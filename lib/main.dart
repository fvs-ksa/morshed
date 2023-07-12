import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/another_services_cubit/about_us_cubit/cubit.dart';
import 'package:morshed/bloc/another_services_cubit/terms_cubit/terms_cubit.dart';
import 'package:morshed/bloc/boarding_cubit/cubit.dart';
import 'package:morshed/bloc/chat_cubit/chat_with_support_cubit/chat_support_cubit.dart';
import 'package:morshed/bloc/general_cubit/general_cubit.dart';
import 'package:morshed/bloc/guides_cubit/cubit.dart';
import 'package:morshed/bloc/location_cubit/cubit.dart';
import 'package:morshed/bloc/login_cubit/login_cubit.dart';
import 'package:morshed/bloc/notification_cubit/cubit.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/setting_cubit/cubit.dart';
import 'package:morshed/bloc/show_office_provider_info/cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/pallete.dart';
import 'package:morshed/screen/borading_screen/boarding_screen.dart';
import 'package:morshed/screen/bottom_navigations_screens/main_screen.dart';
import 'package:morshed/translation/codegen_loader.g.dart';
import 'package:morshed/utiels/navigation_Services.dart';
import 'package:morshed/utiels/shared_pref.dart';
import 'package:morshed/utiels/socket.dart';
import 'bloc/companions_cubit/cubit.dart';
import 'bloc_observe.dart';
import 'constant/const_color.dart';
import 'constant/text_theme.dart';
import 'fcm/fcm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp();
  final locationService = LocationService();
  locationService.start();

  FirebaseNotifications().setUpFirebase();
  Bloc.observer = MyBlocObserver();
  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? remoteMessage) {
    //navigateForwardReplace(const NotificationScreen());
    print('App Killed And navigate :${remoteMessage?.data}');
  });
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  await FirebaseMessaging.instance.getToken().then((value) {
    CacheHelper.saveData(key: 'fcmToken', value: value);
  });
  fcmToken = CacheHelper.getData(key: 'fcmToken');
  print('<<<<<<<<<<<<<$fcmToken>>>>>>>>>>>>>');

  Widget widget;
  if (CacheHelper.getData(key: 'token') == null) {
    widget = BoardingScreen();
    //  navigateForwardReplace(BoardingScreen());
    print('noooo');
  } else {
    token = CacheHelper.getData(key: 'token');
    // userType = CacheHelper.getData(key: 'user_type');
    print('<<<<<<<<<<<<<<<<$token>>>>>>>>>>>>>>>>');
    widget = MainScreen(
        // userIndex: userType,
        );
  }

  ///CacheHelper.getData(key: 'isEnglish');
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/langs',
        assetLoader: const CodegenLoader(),
        startLocale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        child: MyApp(
          startWidget: widget,
        )),
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

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
              create: (context) => BoardingCubit()
                ..initialization()
                ..getCurrentLocation()
                ..getUserCurrentLocation(context)
          ),
          BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit()
                ..getCurrentLocation()
                ..getUserCurrentLocation(context)
                ..getAllCompanies()),
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          BlocProvider<GeneralCubit>(
              create: (context) => GeneralCubit()..initialization()),
          BlocProvider<ChatWithSupportCubit>(
              create: (context) => ChatWithSupportCubit()),
          BlocProvider<ProfileCubit>(
              create: (context) => ProfileCubit()..getProfileDate()),
          BlocProvider<SettingCubit>(create: (context) => SettingCubit()),
          BlocProvider<SubmitReportCubit>(
              create: (context) => SubmitReportCubit()
                ..getMyReports()
                ..getAssistanceWays()),
          BlocProvider<AccountTypeCubit>(
              create: (context) => AccountTypeCubit()),
          BlocProvider<NotificationCubit>(
              create: (context) => NotificationCubit()..getNotificationData()),
          BlocProvider<AddCompanionsCubit>(
            create: (context) => AddCompanionsCubit()..getMyCompanions(),
          ),
          BlocProvider<TermsCubit>(
              create: (context) => TermsCubit()..getTermsData()),
          BlocProvider<GuidesCubit>(
              create: (context) => GuidesCubit()..getAllGuides()),
          BlocProvider<AboutUsCubit>(
              create: (context) => AboutUsCubit()..getAboutUsInfo()),
          BlocProvider<LocationCubit>(
              create: (context) => LocationCubit()
                ..getCurrentLocation()
                ..getUserCurrentLocation(context)),
          BlocProvider<ShowOfficesAndProviderInfoCubit>(
              create: (context) => ShowOfficesAndProviderInfoCubit()..getAllOfficesData()),
        ],
        child: ScreenUtilInit(
            designSize: Size(414, 896),

            // useInheritedMediaQuery: true,
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: NavigationService.navigate().navigationKey,
                debugShowCheckedModeBanner: false,
                // locale: DevicePreview.locale(context),
                builder: (context, widget) {
                  return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget!);
                },
                // builder: DevicePreview.appBuilder,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                title: 'مرشد',
                theme: ThemeData(
                  fontFamily: 'cairo',
                  primarySwatch: Palette.primaryColor,
                  textTheme: responsiveTextTheme(context),
                ),
                home: startWidget,
              );
            }),
      ),
    );
  }
}
