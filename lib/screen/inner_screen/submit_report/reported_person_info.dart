import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../constant/const_color.dart';
import '../../../component/info_profile_component.dart';
import '../../../component/report_Details_widget.dart';

class ReportedPersonInfo extends StatelessWidget {
  TextEditingController arabicNameController =
      TextEditingController(text: 'محمد احمد علي');
  TextEditingController englishNameController =
      TextEditingController(text: 'Mohamed Ahmed Ali');
  TextEditingController phoneNumberController =
      TextEditingController(text: '123456789');
  TextEditingController emailController =
      TextEditingController(text: 'mohamed22@gmail.com');
  TextEditingController passportController =
      TextEditingController(text: 'A154786325');
  TextEditingController visaNumberController =
      TextEditingController(text: '1478523699');
  TextEditingController borderNumberController =
      TextEditingController(text: '542136521');
  TextEditingController ageController = TextEditingController(text: '35 سنه');
  TextEditingController nationalityController =
      TextEditingController(text: 'أردني');
  TextEditingController arrivalDateController =
      TextEditingController(text: '15/12/2022');
  TextEditingController leaveController =
      TextEditingController(text: '25/4/2023');
  TextEditingController residencyController =
      TextEditingController(text: 'المدينه المنوره');
  TextEditingController touristCompanyController =
      TextEditingController(text: 'الشركه المتحده للسياحه');
  TextEditingController saudiRepresentativeController =
      TextEditingController(text: 'وكيل سعودي');

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var reportCubit=SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit,SubmitReportState>(
      listener: (context,state){},
      builder:(context,state){
        return Scaffold(
          appBar: headerInfoPerson(
            avatarChild: Image.asset('assets/images/profile.png'),
              context: context, title:LocaleKeys.moetamerInfo.tr() , isProfile: false),
         backgroundColor: whiteLightColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
            margin: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w),
                  child: Column(
                    children: [
                      textFormField(
                          labelText:LocaleKeys.arabicNamePassport.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: arabicNameController),
                      textFormField(
                          labelText:LocaleKeys.englishNamePassport.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: englishNameController),
                      textFormField(
                          labelText:LocaleKeys.nationality.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: nationalityController),
                      textFormField(
                          labelText:LocaleKeys.age.tr(),
                          context: context,
                          isEnabled: false,
                          controller: ageController),
                      textFormField(
                          labelText:LocaleKeys.email.tr(),
                          context: context,
                          isEnabled: false,
                          controller: emailController),
                      textFormField(
                          labelText:LocaleKeys.boardNo.tr(),
                          context: context,
                          isEnabled: false,
                          controller: borderNumberController),
                      textFormField(
                          labelText:LocaleKeys.visaNo.tr(),
                          context: context,
                          isEnabled: false,
                          controller: visaNumberController),
                      textFormField(
                          labelText:LocaleKeys.passportNo.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: passportController),
                      textFormField(
                          labelText:LocaleKeys.arriveDate.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: arrivalDateController),
                      textFormField(
                          labelText:LocaleKeys.leaveDate.tr(),
                          context: context,
                          isEnabled: false,
                          controller: leaveController),
                      textFormField(
                          labelText:LocaleKeys.residentialAddress.tr() ,
                          context: context,
                          isEnabled: false,
                          controller: residencyController),
                      textFormField(
                          labelText:LocaleKeys.officialMissionName.tr(),
                          context: context,
                          isEnabled: false,
                          controller: touristCompanyController),
                      textFormField(
                          labelText:LocaleKeys.agentName.tr(),
                          context: context,
                          isEnabled: false,
                          controller: saudiRepresentativeController),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:  BorderRadius.only(topLeft: Radius.circular(10.sp),topRight: Radius.circular(10.sp) )),
                  padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.03,
                      horizontal: screenSize.width * 0.03),

                  child: SingleChildScrollView(
                    child: ReportDetailsWidget(index: 0),
                  ),
                )
              ],
            ),
          ),
          //bottomSheet: ,
        );
      }
    );
  }
}
