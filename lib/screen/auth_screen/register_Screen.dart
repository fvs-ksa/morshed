import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/account_type_cubit/state.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/auth_header_widget.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/screen/bottom_navigations_screens/main_screen.dart';
import 'package:morshed/screen/inner_screen/locations/set_location_on_map.dart';
import 'package:quickalert/quickalert.dart';
import '../../component/info_profile_component.dart';
import '../../component/navigation_functions.dart';
import '../../translation/locale_keys.g.dart';
import '../inner_screen/privacy_policy.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController visaNumberController = TextEditingController();
  TextEditingController borderNumberController = TextEditingController();

  //TextEditingController agentNameController=TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController arafaLocController =
      TextEditingController(text: arafaLoc);
  TextEditingController mozdalifaLocController =
      TextEditingController(text: mozdalifaLoc);
  TextEditingController mennaLocController =
      TextEditingController(text: meenaLoc);
  TextEditingController maccaHotelLocController =
      TextEditingController(text: maccaHotelLocation);
  TextEditingController madinaHotelLocController =
      TextEditingController(text: madinaHotelLocation);
  TextEditingController maccaHotelNameController = TextEditingController();
  TextEditingController madinaHotelNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var registerCubit = RegisterCubit.get(context);
    var accountTypeCubit = AccountTypeCubit.get(context);
    return BlocConsumer<AccountTypeCubit, AccountTypeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {},
              bloc: registerCubit.viewAboveKeyBoard(),
              builder: (context, state) {
                return Scaffold(
                  body: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: registerCubit.isGetCompany
                        ? Column(
                            children: [
                              headerAuthScreen(
                                context: context,
                                title: accountTypeCubit.isUmrah
                                    ? LocaleKeys.registerNewMoetamer.tr()
                                    : LocaleKeys.registerNewHajji.tr(),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 15.w,
                                        end: 15.w,
                                        bottom: registerCubit.viewInsets.bottom,
                                        top: 10.h),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              labelText: LocaleKeys
                                                  .arabicNamePassport
                                                  .tr(),
                                              // hintText: 'الاسم بالكامل بالعربي حسب الجواز',
                                              context: context,
                                              controller: arabicNameController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              context: context,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              labelText: LocaleKeys
                                                  .englishNamePassport
                                                  .tr(),
                                              // hintText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                                              controller:
                                                  englishNameController),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LocaleKeys.profilePic.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  !registerCubit.isPickImage
                                                      ? CircleAvatar(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          radius: 35.sp,
                                                          backgroundImage:
                                                              const AssetImage(
                                                                  'assets/images/profile.png'),
                                                        )
                                                      : CircleAvatar(
                                                          radius: 35.sp,
                                                          backgroundImage:
                                                              FileImage(
                                                                  registerCubit
                                                                      .file!),
                                                        ),
                                                  // CircleAvatar(
                                                  //   radius: 40.sp,
                                                  //   backgroundColor: lightMainColor,
                                                  //   foregroundImage: const AssetImage(
                                                  //       'assets/images/profile.png'),
                                                  // ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // registerCubit.pickImageFromGallery();
                                                      //     .then((value) {
                                                      //  // Navigator.pop(context);
                                                      // });

                                                      QuickAlert.show(
                                                        context: context,
                                                        confirmBtnColor: darkMainColor,
                                                        confirmBtnText: 'موافق',
                                                        cancelBtnText: 'الغاء',
                                                        type:
                                                            QuickAlertType.confirm,
                                                        title: 'برجاء الأختيار',
                                                       // text: '',
                                                        widget: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                registerCubit
                                                                    .pickImageFromCamera()
                                                                    .then(
                                                                        (value) {
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .camera_alt,
                                                                    color:
                                                                        darkMainColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  AutoSizeText(
                                                                    'الكاميرا',
                                                                    style: TextStyle(color: blackColor),
                                                                    presetFontSizes: [
                                                                      15.sp,
                                                                      12.sp,
                                                                      10.sp
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.w,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                registerCubit
                                                                    .pickImageFromGallery()
                                                                    .then(
                                                                        (value) {
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.photo,
                                                                    color:
                                                                        orangeColor,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  AutoSizeText(
                                                                    'المعرض',
                                                                    style: TextStyle(color: blackColor),
                                                                    presetFontSizes: [
                                                                      15.sp,
                                                                      12.sp,
                                                                      10.sp
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                      // showDialog(
                                                      //     context: context,
                                                      //     builder: (context){
                                                      //       return
                                                      //         AlertDialog(
                                                      //
                                                      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
                                                      //         content:
                                                      //         Column(
                                                      //           mainAxisSize: MainAxisSize.min,
                                                      //           children: [
                                                      //             GestureDetector(
                                                      //               onTap: (){registerCubit.pickImageFromCamera().then((value) {
                                                      //                 Navigator.pop(context);
                                                      //               });},
                                                      //               child: Row(
                                                      //                 children: [
                                                      //                   Icon(Icons.camera_alt,color: darkMainColor,),
                                                      //                   SizedBox(width: 10.w,),
                                                      //                   AutoSizeText('الكاميرا',presetFontSizes: [15.sp,12.sp,10.sp],)
                                                      //                 ],
                                                      //               ),
                                                      //             ),
                                                      //             SizedBox(height: 10.w,),
                                                      //             GestureDetector(
                                                      //               onTap: (){registerCubit.pickImageFromGallery().then((value){
                                                      //                 Navigator.pop(context);
                                                      //               });},
                                                      //               child: Row(
                                                      //                 children: [
                                                      //                   Icon(Icons.photo,color: orangeColor,),
                                                      //                   SizedBox(width: 10.w,),
                                                      //                   AutoSizeText('المعرض',presetFontSizes: [15.sp,12.sp,10.sp],)
                                                      //                 ],
                                                      //               ),
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       );
                                                      //     });
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/camera.png',
                                                      height: 46.h,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                      minHeight: 80.h,
                                                      maxHeight: 80.h,
                                                      // validator: (String val){
                                                      //   if(val.isEmpty){
                                                      //     return 'رجاء ادخال البيانات المطلوبه';
                                                      //   }
                                                      // },
                                                      context: context,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      labelText: LocaleKeys
                                                          .phoneNumber
                                                          .tr(),
                                                      // hintText: 'رقم الجوال',
                                                      controller:
                                                          phoneNumberController),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child:
                                                    decorationContainerWidget(
                                                        radius: 35.sp,
                                                        context: context,
                                                        child: Text(
                                                          '+966',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge,
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                              ),
                                            ],
                                          ),
                                          dropDownButton(
                                            items: registerCubit.nationality
                                                .map((e) {
                                              return DropdownMenuItem(
                                                child: Text(e.toString()),
                                                value: e.toString(),
                                              );
                                            }).toList(),
                                            value:
                                                registerCubit.chooseNationality,
                                            hint: LocaleKeys.nationality.tr(),
                                            fct: (onChange) {
                                              registerCubit.onChangeCountryName(
                                                  onChange);
                                            },
                                            context: context,
                                            // validator: (String val){
                                            //   if(val.isEmpty){
                                            //     return 'رجاء ادخال البيانات المطلوبه';
                                            //   }
                                            // },
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                    minHeight: 80.h,
                                                    maxHeight: 80.h,
                                                    // validator: (String val){
                                                    //   if(val.isEmpty){
                                                    //     return 'رجاء ادخال البيانات المطلوبه';
                                                    //   }
                                                    // },
                                                    maxWidth: 400.w,
                                                    minWidth: 400.w,
                                                    isEnabled: false,
                                                    context: context,
                                                    labelText: registerCubit
                                                            .convertedDateTimeBirth ??
                                                        LocaleKeys.dateOfBirth
                                                            .tr(),
                                                    // hintText:registerCubit.convertedDateTime??LocaleKeys.dateOfBirth.tr(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      registerCubit
                                                          .chooseDateTimeForBirth(
                                                              context: context);
                                                    },
                                                    child: decorationContainerWidget(
                                                        radius: 35.sp,
                                                        context: context,
                                                        child: SvgPicture.asset(
                                                            'assets/svg/Calendar.svg'))),
                                              ),
                                            ],
                                          ),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              context: context,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              labelText: LocaleKeys.email.tr(),
                                              // hintText: 'البريد الالكتروني',
                                              controller: emailController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              maxWidth: 400.w,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              minWidth: 400.w,
                                              context: context,
                                              labelText:
                                                  LocaleKeys.passportNo.tr(),
                                              // hintText: 'رقم الجواز',
                                              controller: passportController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              maxWidth: 400.w,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              minWidth: 400.w,
                                              context: context,
                                              labelText: LocaleKeys.visaNo.tr(),
                                              // hintText: 'رقم التأشيره',
                                              controller: visaNumberController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              context: context,
                                              labelText:
                                                  'رقم الحدود | رقم الإقامة | رقم الهويه الوطنيه',
                                              // hintText: 'رقم الحدود',
                                              controller:
                                                  borderNumberController),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                    minHeight: 80.h,
                                                    maxHeight: 80.h,
                                                    // validator: (String val){
                                                    //   if(val.isEmpty){
                                                    //     return 'رجاء ادخال البيانات المطلوبه';
                                                    //   }
                                                    // },
                                                    isEnabled: false,
                                                    context: context,
                                                    labelText: registerCubit
                                                            .convertedDateTimeArrival ??
                                                        LocaleKeys.arriveDate
                                                            .tr(),
                                                    // hintText:registerCubit.convertedDateTime?? 'تاريخ الوصول',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    registerCubit
                                                        .chooseDateTimeForArrival(
                                                            context: context);
                                                  },
                                                  child: decorationContainerWidget(
                                                      context: context,
                                                      child: Center(
                                                          child: SvgPicture.asset(
                                                              'assets/svg/Calendar.svg')),
                                                      radius: 35.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                    minHeight: 80.h,
                                                    maxHeight: 80.h,
                                                    // validator: (String val){
                                                    //   if(val.isEmpty){
                                                    //     return 'رجاء ادخال البيانات المطلوبه';
                                                    //   }
                                                    // },
                                                    isEnabled: false,
                                                    context: context,
                                                    labelText: registerCubit
                                                            .convertedDateDepurat ??
                                                        LocaleKeys.leaveDate
                                                            .tr(),
                                                    // hintText:registerCubit.convertedDateTime?? 'تاريخ المغادره',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    registerCubit
                                                        .chooseDateTimeDepuration(
                                                            context: context);
                                                  },
                                                  child: decorationContainerWidget(
                                                      context: context,
                                                      child: Center(
                                                          child: SvgPicture.asset(
                                                              'assets/svg/Calendar.svg')),
                                                      radius: 35.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // dropDownButton(
                                          //     items: registerCubit.residence.map((e) {
                                          //       return DropdownMenuItem(
                                          //         child: Text(
                                          //             e['residenceName'].toString()),
                                          //         value: e['id'].toString(),
                                          //       );
                                          //     }).toList(),
                                          //     value: registerCubit.chooseResidence,
                                          //     hint: LocaleKeys.residentialAddress.tr(),
                                          //     fct: (onChange) {
                                          //       registerCubit
                                          //           .onChangeResidence(onChange);
                                          //       print(onChange);
                                          //     },
                                          //     context: context,
                                          //     validator: () {}),
                                          // registerCubit.chooseResidence == '1'
                                          //     ?
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              context: context,
                                              labelText:
                                                  'أسم الفندق في مكه المكرمه',
                                              // hintText: 'رقم الحدود',
                                              controller:
                                                  maccaHotelNameController),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                      minHeight: 80.h,
                                                      maxHeight: 80.h,
                                                      // validator: (String val){
                                                      //   if(val.isEmpty){
                                                      //     return 'رجاء ادخال البيانات المطلوبه';
                                                      //   }
                                                      // },
                                                      context: context,
                                                      isEnabled: false,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      labelText: maccaHotelLocation ==
                                                              ''
                                                          ? 'موقع الفندق في مكه المكرمه'
                                                          : maccaHotelLocation,
                                                      // hintText: 'رقم الجوال',
                                                      controller:
                                                          maccaHotelLocController),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    navigateForward(
                                                        MapScreenForSetLocation(
                                                            i: 4));
                                                  },
                                                  child: decorationContainerWidget(
                                                      context: context,
                                                      child: Center(
                                                          child: SvgPicture.asset(
                                                              'assets/svg/loc.svg')),
                                                      radius: 35.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              context: context,
                                              labelText:
                                                  'أسم الفندق في المدينه المنوره',
                                              // hintText: 'رقم الحدود',
                                              controller:
                                                  madinaHotelNameController),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: textFormField(
                                                      minHeight: 80.h,
                                                      maxHeight: 80.h,
                                                      // validator: (String val){
                                                      //   if(val.isEmpty){
                                                      //     return 'رجاء ادخال البيانات المطلوبه';
                                                      //   }
                                                      // },
                                                      context: context,
                                                      isEnabled: false,
                                                      // keyboardType: TextInputType.phone,
                                                      labelText: madinaHotelLocation ==
                                                              ''
                                                          ? 'موقع الفندق في المدينه المنوره'
                                                          : madinaHotelLocation,
                                                      // hintText: 'رقم الجوال',
                                                      controller:
                                                          madinaHotelLocController),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    navigateForward(
                                                        MapScreenForSetLocation(
                                                            i: 5));
                                                  },
                                                  child: decorationContainerWidget(
                                                      context: context,
                                                      child: Center(
                                                          child: SvgPicture.asset(
                                                              'assets/svg/loc.svg')),
                                                      radius: 35.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              navigateForward(
                                                  MapScreenForSetLocation(
                                                      i: 0));
                                            },
                                            child: textFormField(
                                                minHeight: 80.h,
                                                maxHeight: 80.h,
                                                // validator: (String val){
                                                //   if(val.isEmpty){
                                                //     return 'رجاء ادخال البيانات المطلوبه';
                                                //   }
                                                // },
                                                isEnabled: false,
                                                maxWidth: 400.w,
                                                minWidth: 400.w,
                                                lines: 1,
                                                context: context,
                                                labelText: meenaLoc == ''
                                                    ? 'موقع منى'
                                                    : meenaLoc,

                                                // hintText: 'رقم المخيم  (منى)',
                                                controller: mennaLocController),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              navigateForward(
                                                  MapScreenForSetLocation(
                                                      i: 1));
                                            },
                                            child: textFormField(
                                                minHeight: 80.h,
                                                maxHeight: 80.h,
                                                // validator: (String val){
                                                //   if(val.isEmpty){
                                                //     return 'رجاء ادخال البيانات المطلوبه';
                                                //   }
                                                // },
                                                isEnabled: false,
                                                maxWidth: 400.w,
                                                minWidth: 400.w,
                                                lines: 1,
                                                context: context,
                                                labelText: arafaLoc == ''
                                                    ? 'موقع عرفه'
                                                    : arafaLoc,
                                                // hintText: 'رقم المخيم  (عرفه)',
                                                controller: arafaLocController),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                navigateForward(
                                                    MapScreenForSetLocation(
                                                        i: 2));
                                              },
                                              child: textFormField(
                                                  minHeight: 80.h,
                                                  maxHeight: 80.h,
                                                  // validator: (String val){
                                                  //   if(val.isEmpty){
                                                  //     return 'رجاء ادخال البيانات المطلوبه';
                                                  //   }
                                                  // },
                                                  isEnabled: false,
                                                  maxWidth: 400.w,
                                                  minWidth: 400.w,
                                                  lines: 1,
                                                  context: context,
                                                  labelText: mozdalifaLoc == ''
                                                      ? 'موقع المزدلفه'
                                                      : mozdalifaLoc,
                                                  controller:
                                                      mozdalifaLocController)),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          // textFormField(
                                          //     maxWidth: 400.w,
                                          //     minWidth: 400.w,
                                          //     context: context,
                                          //     labelText: LocaleKeys.maccaHotelName.tr(),
                                          //     // hintText: 'اسم الفندق',
                                          //     controller: arabicNameController),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LocaleKeys.haveDisability.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              Switch.adaptive(
                                                  value: registerCubit
                                                      .isDisability,
                                                  onChanged: (onChanged) {
                                                    registerCubit
                                                        .changeDisabilityValue();
                                                    print(registerCubit
                                                        .isDisability);
                                                  })
                                            ],
                                          ),
                                          registerCubit.isDisability
                                              ? dropDownButton(
                                                  items: registerCubit
                                                      .disabilities
                                                      .map((e) {
                                                    return DropdownMenuItem(
                                                      child: Text(
                                                        e.toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      value: e.toString(),
                                                    );
                                                  }).toList(),
                                                  value: registerCubit
                                                      .chooseDisability,
                                                  hint: LocaleKeys
                                                      .disabilityType
                                                      .tr(),
                                                  fct: (onChange) {
                                                    registerCubit
                                                        .onChangeDisability(
                                                            onChange);
                                                    print(onChange);
                                                  },
                                                  context: context,
                                                  //  validator: () {}
                                                )
                                              : const SizedBox(),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          dropDownButton(
                                            items: registerCubit
                                                .companyModel.companies!
                                                .map((e) {
                                              return DropdownMenuItem(
                                                child: Text(e.companyName!),
                                                value: e.id.toString(),
                                              );
                                            }).toList(),
                                            value: registerCubit.chooseCompany,
                                            hint: LocaleKeys.agentName.tr(),
                                            fct: (onChange) {
                                              registerCubit
                                                  .onChangeCompany(onChange);
                                              print(onChange);
                                            },
                                            context: context,
                                            //  validator: () {}
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          // textFormField(
                                          //     context: context,
                                          //     labelText: LocaleKeys.agentName.tr(),
                                          //     maxWidth: 400.w,
                                          //     minWidth: 400.w,
                                          //     // hintText: 'اسم الوكيل',
                                          //     controller: agentNameController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  registerCubit
                                                      .changeVisabilityState();
                                                },
                                                icon: registerCubit.isVisable
                                                    ? Icon(Icons.visibility_off)
                                                    : Icon(Icons.visibility),
                                              ),
                                              context: context,
                                              labelText:
                                                  LocaleKeys.password.tr(),
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              secure: registerCubit.isVisable,
                                              //  hintText: 'كلمه المرور',
                                              controller: passwordController),
                                          textFormField(
                                              minHeight: 80.h,
                                              maxHeight: 80.h,
                                              // validator: (String val){
                                              //   if(val.isEmpty){
                                              //     return 'رجاء ادخال البيانات المطلوبه';
                                              //   }
                                              // },
                                              context: context,
                                              secure: registerCubit.isVisable,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  registerCubit
                                                      .changeVisabilityState();
                                                },
                                                icon: registerCubit.isVisable
                                                    ? Icon(Icons.visibility_off)
                                                    : Icon(Icons.visibility),
                                              ),
                                              labelText: LocaleKeys
                                                  .confirmPassword
                                                  .tr(),
                                              maxWidth: 400.w,
                                              minWidth: 400.w,
                                              controller:
                                                  confirmPasswordController),
                                          richText(
                                              navigation: () => navigateForward(
                                                  TermsScreen()),
                                              text: LocaleKeys
                                                  .whenYouRegisterYouAgree
                                                  .tr(),
                                              tappedText:
                                                  LocaleKeys.privacyPolicy.tr(),
                                              context: context),
                                          SizedBox(
                                            height: 15.w,
                                          ),
                                          state is RegisterLoadingState
                                              ? const CircularProgressIndicator()
                                              : mainButton(
                                                  // width: double.infinity,
                                                  // height: size.height * 0.07,
                                                  text: LocaleKeys.registerNow
                                                      .tr(),
                                                  color: darkMainColor,
                                                  context: context,
                                                  fct: () {
                                                    if (registerCubit.file ==
                                                        null) {
                                                      showToast(
                                                          text:
                                                              'برجاء تحديد صوره شخصية',
                                                          state:
                                                              ToastState.ERROR);
                                                    } else {
                                                      registerCubit
                                                          .userRegister(
                                                              maccaHotelName:
                                                                  maccaHotelNameController
                                                                      .text,
                                                              madinahHotelName:
                                                                  madinaHotelNameController
                                                                      .text,
                                                              nameAr:
                                                                  arabicNameController
                                                                      .text,
                                                              nameEn:
                                                                  englishNameController
                                                                      .text,
                                                              phoneNumber:
                                                                  phoneNumberController
                                                                      .text,
                                                              email: emailController
                                                                  .text,
                                                              visaNo:
                                                                  visaNumberController
                                                                      .text,
                                                              passportNo:
                                                                  passportController
                                                                      .text,
                                                              borderNo:
                                                                  borderNumberController
                                                                      .text,
                                                              // agentName: agentNameController
                                                              //     .text,
                                                              password:
                                                                  passwordController
                                                                      .text,
                                                              confirmPassword:
                                                                  confirmPasswordController
                                                                      .text,
                                                              imageFile:
                                                                  registerCubit
                                                                      .file!);
                                                      // navigateForward(MainScreen());
                                                    }
                                                  }),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          richText(
                                              navigation: () => navigateForward(
                                                  LoginScreen()),
                                              text: LocaleKeys.haveAccount.tr(),
                                              tappedText:
                                                  LocaleKeys.loginNow.tr(),
                                              context: context),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                );
              });
        });
  }
}
