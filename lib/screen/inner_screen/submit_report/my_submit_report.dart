import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/component/report_Details_widget.dart';
import '../../../bloc/submitting_report/submit_report_cubit.dart';
import '../../../bloc/submitting_report/submit_report_state.dart';

class MySubmitReport extends StatelessWidget {
  const MySubmitReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reportCubit = SubmitReportCubit.get(context);
    Size screenSize = MediaQuery.of(context).size;
    return BlocConsumer<SubmitReportCubit,SubmitReportState>(
      listener: (context,state){},
      builder: (context,state) {
        return Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.04,vertical: screenSize.height*0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تفاصيل البلاغ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                ReportDetailsWidget(index: 1),
                // bigTextFieldForNotes(
                //     context: context, hint: 'ملاحظات | طريقه المساعده'),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Expanded(
                //         child: textFormField(
                //             labelText: 'الموقع',
                //             hintText: 'hintText',
                //             context: context,
                //             isEnabled: false)),
                //     SizedBox(
                //       width: screenSize.width * 0.06,
                //     ),
                //     decorationContainerWidget(
                //         context: context,
                //         radius: 20.sp,
                //         width: screenSize.width * 0.14,
                //         height: screenSize.height * 0.06,
                //         child: SvgPicture.asset('assets/svg/loc.svg')),
                //   ],
                // ),
                // TextButton(
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       'تغيير الموقع',
                //       style: TextStyle(
                //           color: darkMainColor, decoration: TextDecoration.underline),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                //   onPressed: () {},
                // ),
                // Text(
                //   'كيف يمكننا مساعدتك؟',
                //   style: Theme.of(context).textTheme.headline1,
                // ),
                // Container(
                //   height: screenSize.height * 0.26,
                //   child: ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //       itemCount: helpWays.length,
                //       itemBuilder: (context, index) {
                //         return CheckboxListTile(
                //             controlAffinity: ListTileControlAffinity.leading,
                //             checkboxShape: RoundedRectangleBorder(
                //                 borderRadius:
                //                 BorderRadius.circular(5)),
                //             contentPadding: EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.01,vertical: 0),
                //             value: helpWays[index].value,
                //             title: Text(helpWays[index].title,style: Theme.of(context).textTheme.bodyText2,),
                //
                //               onChanged: (onChange) {
                //                // reportCubit.changeCheckBox(onChange,index);
                //                 index == 0
                //                     ? reportCubit
                //                         .changeHelpWaysFirstIndexState(onChange)
                //                     : index == 1
                //                         ? reportCubit
                //                             .changeHelpWaysSecondIndexState(onChange)
                //                         : index == 2
                //                             ? reportCubit
                //                                 .changeHelpWaysThirdIndexState(onChange)
                //                             : reportCubit
                //                                 .changeHelpWaysLastIndexState(onChange);
                //               },);
                //         // return Row(
                //         //   children: [
                //         //     Checkbox(
                //         //       value: helpWays[index].value,
                //         //       onChanged: (onChange) {
                //         //         reportCubit.changeCheckBox(onChange,index);
                //         //         // index == 0
                //         //         //     ? reportCubit
                //         //         //         .changeHelpWaysFirstIndexState(onChange)
                //         //         //     : index == 1
                //         //         //         ? reportCubit
                //         //         //             .changeHelpWaysSecondIndexState(onChange)
                //         //         //         : index == 2
                //         //         //             ? reportCubit
                //         //         //                 .changeHelpWaysThirdIndexState(onChange)
                //         //         //             : reportCubit
                //         //         //                 .changeHelpWaysLastIndexState(onChange);
                //         //       },
                //         //     ),
                //         //     Expanded(child: Text(helpWays[index].title))
                //         //   ],
                //         // );
                //       }),
                // ),
                // Padding(
                //   padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.04,bottom: screenSize.height*0.02,start: screenSize.width*0.03,end:screenSize.width*0.03 ),
                //   child: Align(alignment: Alignment.center,child: mainButton(width: screenSize.width*0.8, height: screenSize.height*0.07, text: 'تقديم بلاغ', color: darkMainColor, context: context, fct: (){})),
                // )
              ],
            ),
          ),
        );
      }
    );
  }
}
