import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/screen/inner_screen/submit_report/reported_person_info.dart';
import 'package:sizer/sizer.dart';

import '../../../component/const_color.dart';
import '../../../component/info_profile_component.dart';
import '../../../component/reports_widgets.dart';

class SubmitReportAnotherPerson extends StatelessWidget {
  const SubmitReportAnotherPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var submitReport = SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit, SubmitReportState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04,vertical: screenSize.height*0.02),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  textFormField(
                    suffixIcon: SvgPicture.asset('assets/svg/scan.svg',height: screenSize.height*0.001,width: screenSize.width*0.001,),
                      labelText: 'البحث بالباركود',
                      context: context,
                      onTap: () {
                        print('object');
                      },
                      isEnabled: false),
                  textFormField(
                      labelText: 'البحث برقم الجواز',
                      context: context,
                      keyboardType: TextInputType.phone),
                  textFormField(
                      labelText: 'البحث بالرقم التسلسلي',
                      context: context,
                      keyboardType: TextInputType.phone),
                  textFormField(labelText: 'البحث بأسم الفندق', context: context),
                  textFormField(
                      labelText: 'البحث برقم التأشيرة',
                      context: context,
                      keyboardType: TextInputType.phone),
                  dropDownButton(
                      items: submitReport.country.map((e) {
                        return DropdownMenuItem(
                          child: Text(e,style: Theme.of(context).textTheme.bodyText2,),
                          value: e,
                        );
                      }).toList(),
                      value: submitReport.chooseCountry,
                      hint: 'الدوله',
                      fct: (onChange) {
                        submitReport.onChangeCountryName(onChange);
                      },
                      context: context,
                      validator: () {}),
                  dropDownButton(
                      items: submitReport.sexList.map((e) {
                        return DropdownMenuItem(
                          child: Text(e,style: Theme.of(context).textTheme.bodyText2,),
                          value: e,
                        );
                      }).toList(),
                      value: submitReport.sex,
                      hint: 'الجنس',
                      fct: (onChange) {
                        submitReport.onChangeSex(onChange);
                      },
                      context: context,
                      validator: () {}),
                  locationWidget(context:context),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.04,bottom: screenSize.height*0.02,start: screenSize.width*0.03,end:screenSize.width*0.03 ),
                    child: Align(alignment: Alignment.center,child: mainButton(width: screenSize.width*0.8,
                        height: screenSize.height*0.07, text: 'تأكيد معلومات المبلغ عنه', color: darkMainColor, context: context,
                        fct: (){navigateForward( ReportedPersonInfo());})),
                  )
                ],
              ),
            ),
          );
        });
  }
}
