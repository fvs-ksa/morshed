import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/account_type_cubit/state.dart';
import 'package:morshed/bloc/register_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/screen/bottom_navigations_screens/main_screen.dart';
import 'package:sizer/sizer.dart';

import '../../component/info_profile_component.dart';
import '../../component/navigation_functions.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({Key? key}) : super(key: key);
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
                    Container(
                      height: size.height * 0.19,
                      padding: EdgeInsetsDirectional.only(
                          top: size.height * 0.07,
                          start: size.width * 0.07,
                          end: size.width * 0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              backButtonWidget(fct: (){Navigator.pop(context);}),
                              Text(
                                accountTypeCubit.isUmrah?'تسجيل معتمر جديد': 'تسجيل حاج جديد',
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                          Image.asset(
                            'assets/images/مرشد.png',
                            height: size.height * 0.2,
                            width: size.width * 0.3,
                          )
                        ],
                      ),
                    ),
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
                                  labelText: 'الاسم بالكامل بالعربي حسب الجواز',
                                  hintText: 'الاسم بالكامل بالعربي حسب الجواز',
                                  context: context,
                                  controller: arabicNameController),
                              textFormField(
                                  context: context,
                                  labelText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                                  hintText: 'الاسم بالكامل بالانجليزيه حسب الجواز',
                                  controller: arabicNameController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'صوره شخصية',
                                    style: Theme.of(context).textTheme.headline1,
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
                                        labelText: 'رقم الجوال',
                                        hintText: 'رقم الجوال',
                                        controller: phoneNumberController),
                                  ),
                                  SizedBox(width: size.width*0.07,),
                                  decorationContainerWidget(radius: 35.sp,context: context,child:Text('+966',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,)),
                                ],
                              ),
                              dropDownButton(
                                  items: registerCubit.nationality.map((e){
                                    return DropdownMenuItem(child: Text(e.toString()),value: e.toString(),);
                                  }).toList(),
                                  value: registerCubit.chooseNationality,
                                  hint: 'الجنسيه',
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
                                        labelText:registerCubit.convertedDateTime??'تاريخ الميلاد',
                                        hintText:registerCubit.convertedDateTime?? 'تاريخ الميلاد',
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
                                  labelText: 'البريد الالكتروني',
                                  hintText: 'البريد الالكتروني',
                                  controller: emailController),
                              textFormField(
                                  context: context,
                                  labelText: 'رقم الجواز',
                                  hintText: 'رقم الجواز',
                                  controller: passportController),
                              textFormField(
                                  context: context,
                                  labelText: 'رقم التأشيره',
                                  hintText: 'رقم التأشيره',
                                  controller: visaNumberController),
                              textFormField(
                                  context: context,
                                  labelText: 'رقم الحدود',
                                  hintText: 'رقم الحدود',
                                  controller:borderNumberController),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    flex:1,
                                    child: textFormField(
                                      isEnabled: false,
                                      context: context,
                                      labelText:registerCubit.convertedDateTime??'تاريخ الوصول',
                                      hintText:registerCubit.convertedDateTime?? 'تاريخ الوصول',
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
                                      labelText:registerCubit.convertedDateTime??'تاريخ المغادره',
                                      hintText:registerCubit.convertedDateTime?? 'تاريخ المغادره',
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
                                  hint: 'مقر السكن مكه | المدينه',
                                  fct: (onChange){
                                    registerCubit.onChangeResidence(onChange);
                                    print(onChange);
                                  },
                                  context: context,
                                  validator: (){}),
                              registerCubit.chooseResidence=='1'?textFormField(
                                  context: context,
                                  labelText: 'رقم المخيم  (منى)',
                                  hintText: 'رقم المخيم  (منى)',
                                  controller: arabicNameController):const SizedBox(),
                              registerCubit.chooseResidence=='1'? textFormField(
                                  context: context,
                                  labelText: 'رقم المخيم  (عرفه)',
                                  hintText: 'رقم المخيم  (عرفه)',
                                  controller: arabicNameController):const SizedBox(),
                              registerCubit.chooseResidence=='1'? textFormField(
                                  context: context,
                                  labelText: 'رقم المخيم  (المزدلفه)',
                                  hintText: 'رقم المخيم  (المزدلفه)',
                                  controller: arabicNameController):const SizedBox(),
                              textFormField(
                                  context: context,
                                  labelText: 'اسم الفندق',
                                  hintText: 'اسم الفندق',
                                  controller: arabicNameController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'هل تعاني من اعاقة؟',
                                    style: Theme.of(context).textTheme.headline1,
                                  ),
                                  Switch.adaptive(value: registerCubit.isDisability, onChanged: (onChanged){
                                    registerCubit.changeDisabilityValue();
                                    print(registerCubit.isDisability);
                                  })
                                ],
                              ),
                             registerCubit.isDisability? dropDownButton(
                                  items: registerCubit.disabilities.map((e){
                                    return DropdownMenuItem(child: Text(e.toString()),value: e.toString(),);
                                  }).toList(),
                                  value: registerCubit.chooseDisability,
                                  hint: 'نوع الاعاقه',
                                  fct: (onChange){
                                    registerCubit.onChangeDisability(onChange);
                                    print(onChange);
                                  },
                                  context: context,
                                  validator: (){}):const SizedBox(),
                              textFormField(
                                  context: context,
                                  labelText: 'اسم الوكيل',
                                  hintText: 'اسم الوكيل',
                                  controller: arabicNameController),
                              textFormField(
                                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                                  context: context,
                                  labelText: 'كلمه المرور',
                                  hintText: 'كلمه المرور',
                                  controller: arabicNameController),
                              textFormField(
                                  context: context,
                                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                                  labelText: 'تأكيد كلمه المرور',
                                  hintText: 'تأكيد كلمه المرور',
                                  controller: arabicNameController),
                              richText(navigation: ()=>navigateForward(RegisterScreen()), text: 'بالقيام بالتسجيل فأنت توافق على ',
                                  tappedText: 'الشروط و الاحكام', context: context),
                          SizedBox(height: size.height*0.04,),
                          mainButton(width: double.infinity, height: size.height*0.07, text: 'تسجيل', color: darkMainColor, context: context, fct: (){
                            navigateForward(MainScreen());
                          }),
                              SizedBox(height: size.height*0.02,),
                              richText(navigation: ()=>navigateForward(LoginScreen()), text: 'لديك حساب ؟ ', tappedText: 'الدخول الآن', context: context),
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
