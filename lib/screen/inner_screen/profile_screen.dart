import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/profile_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:sizer/sizer.dart';

import '../../component/info_profile_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var profileCubit=ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state) {
        return GestureDetector(
          onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
          child: Scaffold(
            appBar: headerInfoPerson(context: context, title: 'الحساب',isProfile: true,avatarChild: Image.asset('assets/images/profile.png')),
            body: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.06,end: screenSize.width*0.06),
                child: Column(
                  children: [
                    textFormField(labelText: 'الاسم بالكامل بالعربي حسب الجواز', hintText: '', context: context,),
                    textFormField(labelText: 'الاسم بالكامل بالانجليزي حسب الجواز', hintText: 'hintText', context: context),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: textFormField(labelText: 'رقم الجوال', hintText: 'hintText', context: context,keyboardType: TextInputType.number)),
                        SizedBox(width: screenSize.width*0.06,),
                        decorationContainerWidget(radius: 35.sp,context: context,child:Text('+966',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,)),
                      ],
                    ),
                    dropDownButton(
                        items: profileCubit.nationality.map((e){
                          return DropdownMenuItem(child: Text(e.toString(),style: Theme.of(context).textTheme.caption,),value: e.toString(),);
                        }).toList(),
                        value: profileCubit.chooseNationality,
                        hint: 'الجنسيه',
                        fct: (onChange){
                          profileCubit.onChangeCountryName(onChange);
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
                            labelText:profileCubit.convertedDateTime??'تاريخ الميلاد',
                            hintText:profileCubit.convertedDateTime?? 'تاريخ الميلاد',
                          ),
                        ),
                        SizedBox(width: screenSize.width*0.07,),
                        GestureDetector(
                          onTap: () async {
                            profileCubit.chooseDateTime(context: context);
                          },
                          child: decorationContainerWidget(radius: 35.sp,context: context, child: SvgPicture.asset('assets/svg/Calendar.svg'))
                        ),
                      ],
                    ),
                    textFormField(labelText: 'البريد الألكتروني', hintText: 'hintText', context: context,keyboardType: TextInputType.emailAddress),
                    textFormField(labelText: 'رقم الجواز', hintText: 'hintText', context: context),
                    textFormField(labelText: 'رقم التأشيره', hintText: 'hintText', context: context),
                    textFormField(labelText: 'اسم شركه العمره | الحمله', hintText: 'hintText', context: context),
                    textFormField(labelText: 'اسم الوكيل', hintText: 'hintText', context: context),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: screenSize.height*0.06,horizontal: screenSize.width*0.03),
                      child: mainButton(width: screenSize.width*0.8, height: screenSize.height*0.07, text: 'تعديل', color: orangeColor, context: context, fct: (){}),
                    )


                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
