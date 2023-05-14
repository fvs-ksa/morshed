import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/screen/inner_screen/submit_report/reported_person_info.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../constant/const_color.dart';
import '../../../component/navigation_functions.dart';
import '../../../component/reports_widgets.dart';

class SubmitReportAnotherPerson extends StatelessWidget {
  const SubmitReportAnotherPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var submitReport = SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit, SubmitReportState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
            child: Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 30.w,vertical:8.h ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    textFormField(
                      suffixIcon: SvgPicture.asset('assets/svg/scanQR.svg',fit: BoxFit.none),
                        labelText:LocaleKeys.findingInformationByScanningQrCode.tr(),
                        context: context,
                        onTap: () {
                          print('object');
                        },
                        isEnabled: false),
                    textFormField(
                        labelText:LocaleKeys.findingInformationUsingPassportNumber.tr(),
                        context: context,
                        keyboardType: TextInputType.phone),
                    textFormField(
                        labelText:LocaleKeys.findingInformationUsingId.tr() ,
                        context: context,
                        keyboardType: TextInputType.phone),
                    textFormField(labelText:LocaleKeys.findingInformationUsingHotelName.tr() , context: context),
                    textFormField(
                        labelText:LocaleKeys.findingInformationUsingVisaNumber.tr(),
                        context: context,
                        keyboardType: TextInputType.phone),
                    dropDownButton(
                        items: submitReport.country.map((e) {
                          return DropdownMenuItem(
                            child: Text(e,style: Theme.of(context).textTheme.labelSmall,),
                            value: e,
                          );
                        }).toList(),
                        value: submitReport.chooseCountry,
                        hint:LocaleKeys.country.tr(),
                        fct: (onChange) {
                          submitReport.onChangeCountryName(onChange);
                        },
                        context: context,
                        validator: () {}),
                    dropDownButton(
                        items: submitReport.sexList.map((e) {
                          return DropdownMenuItem(
                            child: Text(e,style: Theme.of(context).textTheme.labelSmall,),
                            value: e,
                          );
                        }).toList(),
                        value: submitReport.sex,
                        hint:LocaleKeys.sex.tr() ,
                        fct: (onChange) {
                          submitReport.onChangeSex(onChange);
                        },
                        context: context,
                        validator: () {}),
                    locationWidget(context:context),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(
                          top:10.h ,
                          bottom:8.h ,
                          start:10.w,
                          end:10.w ),
                      child: Align(alignment: Alignment.center,child: mainButton(
                          text:LocaleKeys.search.tr(), color: darkMainColor, context: context,
                          fct: (){navigateForward( ReportedPersonInfo());})),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
