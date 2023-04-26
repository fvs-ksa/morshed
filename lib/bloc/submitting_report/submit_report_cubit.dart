import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';

class SubmitReportCubit extends Cubit<SubmitReportState>{
  SubmitReportCubit():super(InitialSubmitReportState());
  static SubmitReportCubit get(context)=>BlocProvider.of(context);
  int index=0;
  changeTabBarIndex({required var value}){
    index=value;
    emit(ChangeTabBarSubmitReportState());
  }
}