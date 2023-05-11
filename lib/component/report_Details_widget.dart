import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/submitting_report/submit_report_cubit.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../models/help_ways.dart';
import 'component.dart';
import '../constant/const_color.dart';
import 'info_profile_component.dart';

class ReportDetailsWidget extends StatelessWidget {
  int? index;
   ReportDetailsWidget({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var reportCubit=SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit,SubmitReportState>(
      listener: (context,state){},
      builder: (context,state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           index==0? Text(
           LocaleKeys.WhatCanWeDoToAssistHim.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ):Container(),
           index==0? Container(
              height: 204.h,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: helpWays.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsetsDirectional.symmetric(
                          horizontal: screenSize.width * 0.01,
                          vertical: 0),
                      value: helpWays[index].value,
                      title: Text(

                        helpWays[index].title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onChanged: (onChange) {
                        // reportCubit.changeCheckBox(onChange,index);
                        index == 0
                            ? reportCubit
                            .changeHelpWaysFirstIndexState(onChange)
                            : index == 1
                            ? reportCubit
                            .changeHelpWaysSecondIndexState(
                            onChange)
                            : index == 2
                            ? reportCubit
                            .changeHelpWaysThirdIndexState(
                            onChange)
                            : reportCubit
                            .changeHelpWaysLastIndexState(
                            onChange);
                      },
                    );
                  }),
            ):Container(),
            bigTextFieldForNotes(
                context: context, hint:LocaleKeys.commentsAndAssistance.tr()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: textFormField(
                        labelText: LocaleKeys.reportLocation.tr(),
                       // hintText: 'hintText',
                        context: context,
                        isEnabled: false)),
                SizedBox(
                  width: screenSize.width * 0.06,
                ),
                decorationContainerWidget(
                    context: context,
                    radius: 20.sp,
                    width: screenSize.width * 0.14,
                    height: screenSize.height * 0.06,
                    child: SvgPicture.asset('assets/svg/loc.svg')),
              ],
            ),
            TextButton(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.changeLocation.tr(),
                  style: TextStyle(
                      color: darkMainColor,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {},
            ),
            index==1? Text(
              LocaleKeys.WhatCanWeDoToAssistYou.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ):Container(),
            index==1? Container(
              height: screenSize.height * 0.26,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: helpWays.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsetsDirectional.symmetric(
                          horizontal: screenSize.width * 0.01,
                          vertical: 0),
                      value: helpWays[index].value,
                      title: Text(
                        helpWays[index].title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onChanged: (onChange) {
                        // reportCubit.changeCheckBox(onChange,index);
                        index == 0
                            ? reportCubit
                            .changeHelpWaysFirstIndexState(onChange)
                            : index == 1
                            ? reportCubit
                            .changeHelpWaysSecondIndexState(
                            onChange)
                            : index == 2
                            ? reportCubit
                            .changeHelpWaysThirdIndexState(
                            onChange)
                            : reportCubit
                            .changeHelpWaysLastIndexState(
                            onChange);
                      },
                    );
                  }),
            ):Container(),

            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenSize.height * 0.04,
                  bottom: screenSize.height * 0.02,
                  start: screenSize.width * 0.03,
                  end: screenSize.width * 0.03),
              child: Align(
                  alignment: Alignment.center,
                  child: mainButton(
                      // width: screenSize.width * 0.8,
                      // height: screenSize.height * 0.07,
                      text:LocaleKeys.reporting.tr(),
                      color: darkMainColor,
                      context: context,
                      fct: () {})),
            )
          ],
        );
      },

    );
  }
}
