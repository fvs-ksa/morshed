import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/cutom_text_filed.dart';
import 'package:morshed/screen/inner_screen/locations/set_location_on_map.dart';
import 'package:morshed/screen/inner_screen/submit_report/reported_person_info.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../constant/const_color.dart';
import '../../../component/navigation_functions.dart';
import '../../../component/reports_widgets.dart';
import 'package:morshed/bloc/location_cubit/cubit.dart';
import 'package:morshed/bloc/location_cubit/state.dart';

class SubmitReportAnotherPerson extends StatelessWidget {
 final TextEditingController idController = TextEditingController();
   SubmitReportAnotherPerson({Key? key}) : super(key: key);
 // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var submitReport = SubmitReportCubit.get(context);

    //  var locationCubit=LocationCubit.get(context);
    return BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<SubmitReportCubit, SubmitReportState>(
              listener: (context, state) {},
              builder: (context, state) {
                //  TextEditingController reportLocationController=TextEditingController(text:reportLocation==''? locationCubit.address:reportLocation);
                return Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 30.w, vertical: 8.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            submitReport.ScanBarcode();
                            //  navigateForward(QRViewExample());
                          },
                          child: CustomTextField(
                              suffixIcon: SvgPicture.asset(
                                  'assets/svg/scanQR.svg',
                                  fit: BoxFit.none),
                              labelText: LocaleKeys
                                  .findingInformationByScanningQrCode
                                  .tr(),
                              onTap: () {
                                print('object');
                              },
                              isEnabled: false),
                        ),
                        // textFormField(
                        //     labelText: LocaleKeys
                        //         .findingInformationUsingPassportNumber
                        //         .tr(),
                        //     context: context,
                        //     keyboardType: TextInputType.phone),
                        CustomTextField(
                          labelText:
                              LocaleKeys.findingInformationUsingId.tr(),
                          controller: idController,
                          keyboardType: TextInputType.phone,

                        ),
                        // textFormField(
                        //     labelText:
                        //         LocaleKeys.findingInformationUsingHotelName.tr(),
                        //     context: context),
                        // textFormField(
                        //     labelText:
                        //         LocaleKeys.findingInformationUsingVisaNumber.tr(),
                        //     context: context,
                        //     keyboardType: TextInputType.phone),
                        // dropDownButton(
                        //     items: submitReport.country.map((e) {
                        //       return DropdownMenuItem(
                        //         child: Text(
                        //           e,
                        //           style: Theme.of(context).textTheme.labelSmall,
                        //         ),
                        //         value: e,
                        //       );
                        //     }).toList(),
                        //     value: submitReport.chooseCountry,
                        //     hint: LocaleKeys.country.tr(),
                        //     fct: (onChange) {
                        //       submitReport.onChangeCountryName(onChange);
                        //     },
                        //     context: context,
                        //     validator: () {}),
                        // dropDownButton(
                        //     items: submitReport.sexList.map((e) {
                        //       return DropdownMenuItem(
                        //         child: Text(
                        //           e,
                        //           style: Theme.of(context).textTheme.labelSmall,
                        //         ),
                        //         value: e,
                        //       );
                        //     }).toList(),
                        //     value: submitReport.sex,
                        //     hint: LocaleKeys.sex.tr(),
                        //     fct: (onChange) {
                        //       submitReport.onChangeSex(onChange);
                        //     },
                        //     context: context,
                        //     validator: () {}),
                        SizedBox(
                          height: 10.h,
                        ),
                        //  locationWidget(context: context,controller: reportLocationController,fct: (){navigateForward(MapScreenForSetLocation(i: 3));}),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 10.h, bottom: 8.h, start: 10.w, end: 10.w),
                          child: Align(
                              alignment: Alignment.center,
                              child: state is GetUserByIdLoadingState
                                  ? CircularProgressIndicator.adaptive(
                                      backgroundColor: orangeColor,
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                        darkMainColor, //<-- SEE HERE
                                      ),
                                    )
                                  : mainButton(
                                      text: LocaleKeys.search.tr(),
                                      color: darkMainColor,
                                      context: context,
                                      fct: () {
                                        if (idController.text.isEmpty) {
                                          showToast(text: 'من فضلك أدخل الرقم التسلسلي', state: ToastState.ERROR);

                                        }else{
                                          submitReport.getUserById(
                                              id: idController.text);
                                        }

                                        // if(state is GetUserByIdSuccessState){
                                        //
                                        // }
                                      })),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
