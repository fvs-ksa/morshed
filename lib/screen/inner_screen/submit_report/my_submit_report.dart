import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/component/report_Details_widget.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../../bloc/submitting_report/submit_report_cubit.dart';
import '../../../bloc/submitting_report/submit_report_state.dart';

class MySubmitReport extends StatelessWidget {
  const MySubmitReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reportCubit = SubmitReportCubit.get(context);
    return BlocConsumer<SubmitReportCubit, SubmitReportState>(
        listener: (context, state) {},
        builder: (context, state) {

          return  Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w, vertical: 15.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReportDetailsWidget(index: 1),


                ],
              ),
            ),
          );
        });
  }
}
