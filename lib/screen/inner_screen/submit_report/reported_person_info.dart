import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/component.dart';
import '../../../component/const_color.dart';
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
              context: context, title: 'بيانات المعتمر', isProfile: false),
         backgroundColor: whiteLightColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
            margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.03,
            horizontal: screenSize.width * 0.03),
                  child: Column(
                    children: [
                      textFormField(
                          labelText: 'الأسم بالعربيه',
                          context: context,
                          isEnabled: false,
                          controller: arabicNameController),
                      textFormField(
                          labelText: 'الأسم بالانجليزيه',
                          context: context,
                          isEnabled: false,
                          controller: englishNameController),
                      textFormField(
                          labelText: 'الجنسيه',
                          context: context,
                          isEnabled: false,
                          controller: nationalityController),
                      textFormField(
                          labelText: 'السن',
                          context: context,
                          isEnabled: false,
                          controller: ageController),
                      textFormField(
                          labelText: 'البريد الالكتروني',
                          context: context,
                          isEnabled: false,
                          controller: emailController),
                      textFormField(
                          labelText: 'رقم الحدود',
                          context: context,
                          isEnabled: false,
                          controller: borderNumberController),
                      textFormField(
                          labelText: 'رقم التأشيرة',
                          context: context,
                          isEnabled: false,
                          controller: visaNumberController),
                      textFormField(
                          labelText: 'رقم جواز السفر',
                          context: context,
                          isEnabled: false,
                          controller: passportController),
                      textFormField(
                          labelText: 'تاريخ الوصول',
                          context: context,
                          isEnabled: false,
                          controller: arrivalDateController),
                      textFormField(
                          labelText: 'تاريخ المغادره',
                          context: context,
                          isEnabled: false,
                          controller: leaveController),
                      textFormField(
                          labelText: 'مدينه الأقامه',
                          context: context,
                          isEnabled: false,
                          controller: residencyController),
                      textFormField(
                          labelText: 'شركه السياحه',
                          context: context,
                          isEnabled: false,
                          controller: touristCompanyController),
                      textFormField(
                          labelText: 'اسم الوكيل',
                          context: context,
                          isEnabled: false,
                          controller: saudiRepresentativeController),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )),
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
