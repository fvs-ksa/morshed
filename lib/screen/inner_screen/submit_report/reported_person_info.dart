import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/location_cubit/cubit.dart';
import 'package:morshed/bloc/location_cubit/state.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../constant/const_color.dart';
import '../../../component/info_profile_component.dart';
import '../../../component/report_Details_widget.dart';

class ReportedPersonInfo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var reportCubit = SubmitReportCubit.get(context);
    return BlocConsumer<LocationCubit,LocationState>(
      listener: (context,state){},
      builder: (context,state) {
        return BlocConsumer<SubmitReportCubit, SubmitReportState>(
            listener: (context, state) {},
            builder: (context, state) {
              TextEditingController arabicNameController =
              TextEditingController(text:reportCubit.isGetUserById? reportCubit.profileModel.data!.nameAr:"");
              TextEditingController englishNameController =
              TextEditingController(text:reportCubit.isGetUserById?  reportCubit.profileModel.data!.nameEn:"");
              TextEditingController phoneNumberController =
              TextEditingController(text: reportCubit.isGetUserById? reportCubit.profileModel.data!.phoneNumber:"");
              TextEditingController emailController =
              TextEditingController(text:reportCubit.isGetUserById?  reportCubit.profileModel.data!.email:"");
              TextEditingController passportController =
              TextEditingController(text: reportCubit.isGetUserById? reportCubit.profileModel.data!.passportNumber:"");
              TextEditingController visaNumberController =
              TextEditingController(text:reportCubit.isGetUserById?  reportCubit.profileModel.data!.visaNumber:"");
              TextEditingController borderNumberController =
              TextEditingController(text: reportCubit.isGetUserById? reportCubit.profileModel.data!.borderNumber:"");
              //TextEditingController ageController = TextEditingController(text: reportCubit.profileModel.data!.ag);
              TextEditingController nationalityController =
              TextEditingController(text: reportCubit.isGetUserById? reportCubit.profileModel.data!.nationality:"");
              TextEditingController arrivalDateController =
              TextEditingController(text:reportCubit.isGetUserById?  reportCubit.profileModel.data!.arrivalDate:"");
              TextEditingController leaveController =
              TextEditingController(text:reportCubit.isGetUserById? reportCubit.profileModel.data!.departureDate:"");
              // TextEditingController residencyController =
              // TextEditingController(text: 'المدينه المنوره');
              TextEditingController touristCompanyController =
              TextEditingController(text:reportCubit.isGetUserById?  reportCubit.profileModel.data!.agentName:"");
              // TextEditingController saudiRepresentativeController =
              // TextEditingController(text: 'وكيل سعودي');
              return Scaffold(
                appBar: headerInfoPerson(
                    avatarChild: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(reportCubit.isGetUserById?reportCubit.profileModel.data!.image??'https://firebasestorage.googleapis.com/v0/b/murshid-5cf3e.appspot.com/o/profile.png?alt=media&token=9e46dec9-ea36-4118-b7d3-c7d298b302d7':
                      'https://firebasestorage.googleapis.com/v0/b/murshid-5cf3e.appspot.com/o/profile.png?alt=media&token=9e46dec9-ea36-4118-b7d3-c7d298b302d7'),
                    ),
                    context: context,
                    title: LocaleKeys.hajjiInfo.tr(),
                    isProfile: false),
                backgroundColor: whiteLightColor,
                body:reportCubit.isGetUserById? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                        child: Column(
                          children: [
                            textFormField(
                                labelText: LocaleKeys.arabicNamePassport.tr(),
                                context: context,
                                isEnabled: false,
                                controller: arabicNameController),
                            textFormField(
                                labelText: LocaleKeys.englishNamePassport.tr(),
                                context: context,
                                isEnabled: false,
                                controller: englishNameController),
                            textFormField(
                                labelText: LocaleKeys.nationality.tr(),
                                context: context,

                                isEnabled: false,
                                controller: nationalityController),
                            // textFormField(
                            //     labelText: LocaleKeys.age.tr(),
                            //     context: context,
                            //     isEnabled: false,
                            //     controller: ageController),
                            textFormField(
                                labelText: LocaleKeys.email.tr(),
                                context: context,
                                isEnabled: false,
                                controller: emailController),
                            textFormField(
                                labelText: LocaleKeys.boardNo.tr(),
                                context: context,
                                isEnabled: false,
                                controller: borderNumberController),
                            textFormField(
                                labelText: LocaleKeys.visaNo.tr(),
                                context: context,
                                isEnabled: false,
                                controller: visaNumberController),
                            textFormField(
                                labelText: LocaleKeys.passportNo.tr(),
                                context: context,
                                isEnabled: false,
                                controller: passportController),
                            textFormField(
                                labelText: LocaleKeys.arriveDate.tr(),
                                context: context,
                                isEnabled: false,
                                controller: arrivalDateController),
                            textFormField(
                                labelText: LocaleKeys.leaveDate.tr(),
                                context: context,
                                isEnabled: false,
                                controller: leaveController),
                            // textFormField(
                            //     labelText: LocaleKeys.residentialAddress.tr(),
                            //     context: context,
                            //     isEnabled: false,
                            //     controller: residencyController),
                            textFormField(
                                labelText: LocaleKeys.officialMissionName.tr(),
                                context: context,
                                isEnabled: false,
                                controller: touristCompanyController),
                            // textFormField(
                            //     labelText: LocaleKeys.agentName.tr(),
                            //     context: context,
                            //     isEnabled: false,
                            //     controller: saudiRepresentativeController),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.sp),
                                topRight: Radius.circular(10.sp))),
                        padding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
                        child: SingleChildScrollView(
                          child: ReportDetailsWidget(index: 0),
                        ),
                      )
                    ],
                  ),
                ):Center(child: CircularProgressIndicator()),
                //bottomSheet: ,
              );
            });
      }
    );
  }
}
