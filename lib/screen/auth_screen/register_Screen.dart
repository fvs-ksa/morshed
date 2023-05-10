import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:sizer/sizer.dart';
import '../../component/info_profile_component.dart';
import '../../component/navigation_functions.dart';
import '../../translation/locale_keys.g.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController visaNumberController = TextEditingController();
  TextEditingController borderNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var registerCubit=RegisterCubit.get(context);
    var accountTypeCubit=AccountTypeCubit.get(context);
    return BlocConsumer<AccountTypeCubit,AccountTypeState>(
      listener: (context,state){},
      builder: (context,state) {
        return BlocConsumer<RegisterCubit,RegisterState>(
          listener: (context,state){},
          builder: (context,state) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    headerAuthScreen(context: context,
                      title: accountTypeCubit.isUmrah?LocaleKeys.registerNewMoetamer.tr():LocaleKeys.registerNewHajji.tr(),),

                    SizedBox(
                      height: size.height*0.81,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: size.width * 0.07,
                              end: size.width * 0.07,
                              top: size.height * 0.05),
                          child: Column(
                            children: [
                              textFormField(
                                  labelText:LocaleKeys.arabicNamePassport.tr(),
                                 // hintText: 'الاسم بالكامل بالعربي حسب الجواز',
                                  context: context,
                                  controller: arabicNameController),
                              textFormField(
                                  context: context,

                                  labelText:LocaleKeys.englishNamePassport.tr(),
                                 // hintText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                                  controller: arabicNameController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.profilePic.tr(),
                                    style: Theme.of(context).textTheme.displayLarge,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30.sp,
                                        backgroundColor: lightMainColor,
                                        foregroundImage:
                                            AssetImage('assets/images/profile.png'),
                                      ),
                                      Image.asset(
                                        'assets/images/camera.png',
                                        height: size.height * 0.05,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: textFormField(
                                        context: context,
                                        keyboardType: TextInputType.phone,
                                        labelText:LocaleKeys.phoneNumber.tr(),
                                       // hintText: 'رقم الجوال',
                                        controller: phoneNumberController),
                                  ),
                                  SizedBox(width: size.width*0.07,),
                                  decorationContainerWidget(radius: 35.sp,context: context,
                                      child:Text('+966',style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,)),
                                ],
                              ),
                              dropDownButton(
                                  items: registerCubit.nationality.map((e){
                                    return DropdownMenuItem(child: Text(e.toString()),value: e.toString(),);
                                  }).toList(),
                                  value: registerCubit.chooseNationality,
                                  hint:LocaleKeys.nationality.tr(),
                                  fct: (onChange){
                                    registerCubit.onChangeCountryName(onChange);
                                  },
                                  context: context,
                                  validator: (){}),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    flex:1,
                                    child: textFormField(
                                      isEnabled: false,
                                        context: context,
                                        labelText:registerCubit.convertedDateTime??LocaleKeys.dateOfBirth.tr(),
                                       // hintText:registerCubit.convertedDateTime??LocaleKeys.dateOfBirth.tr(),
                                         ),
                                  ),
                                  SizedBox(width: size.width*0.07,),
                                  GestureDetector(
                                      onTap: () async {
                                      registerCubit.chooseDateTime(context: context);
                                      },
                                    child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                                  ),
                                ],
                              ),


                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.email.tr(),
                                 // hintText: 'البريد الالكتروني',
                                  controller: emailController),
                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.passportNo.tr(),
                                 // hintText: 'رقم الجواز',
                                  controller: passportController),
                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.visaNo.tr(),
                                 // hintText: 'رقم التأشيره',
                                  controller: visaNumberController),
                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.boardNo.tr(),
                                 // hintText: 'رقم الحدود',
                                  controller:borderNumberController),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    flex:1,
                                    child: textFormField(
                                      isEnabled: false,
                                      context: context,
                                      labelText:registerCubit.convertedDateTime??LocaleKeys.arriveDate.tr(),
                                     // hintText:registerCubit.convertedDateTime?? 'تاريخ الوصول',
                                    ),
                                  ),
                                  SizedBox(width: size.width*0.07,),
                                  GestureDetector(
                                    onTap: () async {
                                      registerCubit.chooseDateTime(context: context);
                                    },
                                    child: Container(
                                      height: size.height*0.05,
                                      width: size.width*0.2,
                                      child:Center(child: SvgPicture.asset('assets/svg/Calendar.svg')),
                                      decoration: BoxDecoration(
                                          color: babyBlueColor,
                                          borderRadius: BorderRadius.circular(35.sp)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    flex:1,
                                    child: textFormField(
                                      isEnabled: false,
                                      context: context,
                                      labelText:registerCubit.convertedDateTime??LocaleKeys.leaveDate.tr(),
                                     // hintText:registerCubit.convertedDateTime?? 'تاريخ المغادره',
                                    ),
                                  ),
                                  SizedBox(width: size.width*0.07,),
                                  GestureDetector(
                                    onTap: () async {
                                      registerCubit.chooseDateTime(context: context);
                                    },
                                    child: Container(
                                      height: size.height*0.05,
                                      width: size.width*0.2,
                                      child:Center(child: SvgPicture.asset('assets/svg/Calendar.svg')),
                                      decoration: BoxDecoration(
                                          color: babyBlueColor,
                                          borderRadius: BorderRadius.circular(35.sp)),
                                    ),
                                  ),
                                ],
                              ),
                              dropDownButton(
                                  items: registerCubit.residence.map((e){
                                    return DropdownMenuItem(child: Text(e['residenceName'].toString()),value: e['id'].toString(),);
                                  }).toList(),
                                  value: registerCubit.chooseResidence,
                                  hint:LocaleKeys.residentialAddress.tr(),
                                  fct: (onChange){
                                    registerCubit.onChangeResidence(onChange);
                                    print(onChange);
                                  },
                                  context: context,
                                  validator: (){}),
                              registerCubit.chooseResidence=='1'?textFormField(
                                  context: context,
                                  labelText:LocaleKeys.mennaNo.tr() ,
                                 // hintText: 'رقم المخيم  (منى)',
                                  controller: arabicNameController):const SizedBox(),
                              registerCubit.chooseResidence=='1'? textFormField(
                                  context: context,
                                  labelText:LocaleKeys.arfaNo.tr(),
                                 // hintText: 'رقم المخيم  (عرفه)',
                                  controller: arabicNameController):const SizedBox(),
                              registerCubit.chooseResidence=='1'? textFormField(
                                  context: context,
                                  labelText:LocaleKeys.mozdalefaNo.tr(),
                                  //hintText: 'رقم المخيم  (المزدلفه)',
                                  controller: arabicNameController):const SizedBox(),
                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.maccaHotelName.tr(),
                                 // hintText: 'اسم الفندق',
                                  controller: arabicNameController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.haveDisability.tr(),
                                    style: Theme.of(context).textTheme.displayLarge,
                                  ),
                                  Switch.adaptive(value: registerCubit.isDisability, onChanged: (onChanged){
                                    registerCubit.changeDisabilityValue();
                                    print(registerCubit.isDisability);
                                  })
                                ],
                              ),
                             registerCubit.isDisability? dropDownButton(
                                  items: registerCubit.disabilities.map((e){
                                    return DropdownMenuItem(child: Text(e.toString(),style: Theme.of(context).textTheme.labelSmall,),value: e.toString(),);
                                  }).toList(),
                                  value: registerCubit.chooseDisability,

                                  hint:LocaleKeys.disabilityType.tr() ,
                                  fct: (onChange){
                                    registerCubit.onChangeDisability(onChange);
                                    print(onChange);
                                  },
                                  context: context,
                                  validator: (){}):const SizedBox(),
                              textFormField(
                                  context: context,
                                  labelText:LocaleKeys.agentName.tr(),
                                 // hintText: 'اسم الوكيل',
                                  controller: arabicNameController),
                              textFormField(
                                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                                  context: context,
                                  labelText:LocaleKeys.password.tr() ,
                                //  hintText: 'كلمه المرور',
                                  controller: arabicNameController),
                              textFormField(
                                  context: context,
                                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                                  labelText:LocaleKeys.confirmPassword.tr(),
                                 // hintText: 'تأكيد كلمه المرور',
                                  controller: arabicNameController),
                              richText(navigation: ()=>navigateForward(RegisterScreen()),
                                  text:LocaleKeys.whenYouRegisterYouAgree.tr() ,
                                  tappedText: LocaleKeys.privacyPolicy.tr(), context: context),
                          SizedBox(height: size.height*0.04,),
                          mainButton(width: double.infinity, height: size.height*0.07, text:LocaleKeys.registerNow.tr(), color: darkMainColor, context: context, fct: (){
                            navigateForward(MainScreen());
                          }),
                              SizedBox(height: size.height*0.02,),
                              richText(navigation: ()=>navigateForward(LoginScreen()),
                                  text:LocaleKeys.haveAccount.tr(),
                                  tappedText:LocaleKeys.loginNow.tr(), context: context),
                              SizedBox(height: size.height*0.02,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
