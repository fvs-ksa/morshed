import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/profile_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../component/cutom_text_filed.dart';
import '../../component/info_profile_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileCubit = ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        bloc: profileCubit.getProfileDate(),
        builder: (context, state) {
          TextEditingController arNameController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.nameAr! : '');
          TextEditingController enNameController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.nameEn! : '');
          TextEditingController phoneController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.phoneNumber! : '');
          TextEditingController birthDateController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.convertedDateTime ??
                  profileCubit.profileModel.data!.birthdate! : '');
          TextEditingController emailController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.email! : '');
          TextEditingController passportNoController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.passportNumber! : '');
          TextEditingController visaNoController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.visaNumber! : '');
          TextEditingController groupNoController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.companyName ?? '' : '');
          TextEditingController agentController = TextEditingController(
              text: profileCubit.isLoading
                  ?
              profileCubit.profileModel.data!.companyName ?? 'لا يوجد اسم شركه'
                  : '');
          TextEditingController borderController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.borderNumber! : '');
          TextEditingController disabilityController = TextEditingController(
              text: profileCubit.isLoading ?
              profileCubit.profileModel.data!.typeOfDisability! : '');

          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              appBar: headerInfoPerson(
                  context: context,
                  title: LocaleKeys.profile.tr(),
                  isProfile: true,
                  avatarChild: CircleAvatar(
                    radius: 40.sp,
                    backgroundImage: NetworkImage(
                        profileCubit.isLoading ? profileCubit.profileModel.data!
                            .image!
                            : 'https://firebasestorage.googleapis.com/v0/b/murshid-5cf3e.appspot.com/o/profile.png?alt=media&token=9e46dec9-ea36-4118-b7d3-c7d298b302d7'),)),
              body: profileCubit.isLoading == false ? Center(
                  child: CircularProgressIndicator()) : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 40.w, end: 20.w, top: 30),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: arNameController,
                        labelText: LocaleKeys.arabicNamePassport.tr(),
                        // hintText: '',

                      ),
                      CustomTextField(
                          controller: enNameController,
                          labelText: LocaleKeys.englishNamePassport.tr(),
                          // hintText: '',
                         ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CustomTextField(
                                  controller: phoneController,
                                  labelText: LocaleKeys.phoneNumber.tr(),
                                  // hintText: 'hintText',
                                  keyboardType: TextInputType.number)),
                          SizedBox(
                            width: 10.w,
                          ),
                          decorationContainerWidget(
                              radius: 35.sp,
                              context: context,
                              child: Text(
                                '+966',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      dropDownButton(
                        items: profileCubit.nationality.map((e) {
                          return DropdownMenuItem(
                            child: FittedBox(
                              child: Text(
                                e.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall,
                              ),
                            ),
                            value: e.toString(),
                          );
                        }).toList(),
                        value: profileCubit.chooseNationality,
                        hint: profileCubit.chooseNationality == null
                            ? profileCubit.profileModel.data!.nationality!
                            : LocaleKeys.nationality.tr(),
                        fct: (onChange) {
                          profileCubit.onChangeCountryName(onChange);
                        },
                        context: context,
                        //  validator: () {}
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextField(
                              isEnabled: false,
                              controller: birthDateController,
                              labelText:
                              LocaleKeys.dateOfBirth.tr(),
                              // hintText: profileCubit.convertedDateTime ??
                              //     LocaleKeys.dateOfBirth.tr(),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                              onTap: () async {
                                profileCubit.chooseDateTime(context: context);
                              },
                              child: decorationContainerWidget(
                                  radius: 35.sp,
                                  context: context,
                                  child: SvgPicture.asset(
                                      'assets/svg/Calendar.svg'))),
                        ],
                      ),
                      CustomTextField(
                          labelText: LocaleKeys.email.tr(),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress),
                      CustomTextField(
                          labelText: LocaleKeys.passportNo.tr(),
                          controller: passportNoController,

                      ),
                      CustomTextField(
                          labelText: LocaleKeys.visaNo.tr(),
                          controller: visaNoController,

                      ),
                      CustomTextField(
                          labelText: LocaleKeys.boardNo.tr(),
                          controller: borderController,
                      ),
                   //   Text('نوع الاعاقه',style: TextStyle(fontSize: 10),),
                      profileCubit.profileModel.data!.disability!
                          ? dropDownButton
                        (items: profileCubit.disabilities.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.toString()), value: e.toString(),);
                      }).toList(),
                          value: profileCubit.chooseDisability,
                          hint: 'نوع الاعاقه',
                          fct: (onChange) {
                            profileCubit.onChangeDisability(onChange);
                          },
                          context: context)
                          : SizedBox(),
                     profileCubit.profileModel.data!.disability!?  SizedBox(height: 30,):SizedBox(),
                      CustomTextField(
                          labelText: LocaleKeys.officialMissionName.tr(),
                          controller: groupNoController,
                          isEnabled: false,
                          //context: context
                      ),
                      CustomTextField(
                          controller: agentController,
                          isEnabled: false,
                          labelText: LocaleKeys.agentName.tr(),
                         // context: context
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 8.w),
                        child: state is UpdateProfileLoadingState
                            ? CircularProgressIndicator.adaptive(
                          backgroundColor: orangeColor,)
                            : mainButton(
                          // width: screenSize.width * 0.8,
                          //   height: screenSize.height * 0.07,
                            text: LocaleKeys.edit.tr(),
                            color: orangeColor,
                            context: context,
                            fct: () {
                              profileCubit.updateUserInfo
                                (nameAr: arNameController.text,
                                nameEn: enNameController.text,
                                phone: phoneController.text,
                                context: context,
                                // birthDate: birthDate,
                                // nationality: nationality,
                                // locationMenna: locationMenna,
                                email: emailController.text,
                                passport: passportNoController.text,
                                visaNo: visaNoController.text,
                                borderNo: borderController.text,
                                agentName: agentController.text,


                                // birthDate: birthDateController.text,
                                // nationality: '',
                                // arrivalDate: arrivalDate,
                                // depurationDate: depurationDate,
                                // image: image
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
