import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/submitting_report/submit_report_state.dart';
import 'package:morshed/models/help_ways.dart';

class SubmitReportCubit extends Cubit<SubmitReportState>{
  SubmitReportCubit():super(InitialSubmitReportState());
  static SubmitReportCubit get(context)=>BlocProvider.of(context);
  int index=0;
  changeTabBarIndex({required var value}){
    index=value;
    emit(ChangeTabBarSubmitReportState());
  }
  // changeCheckBox(value,int i){
  //   helpWays[i].value=value;
  //   emit(ChangeHelpWayReportState());
  // }
  changeHelpWaysFirstIndexState(var value){
    // helpWays[i].value =! helpWays[i].value;
    // emit(ChangeHelpWayReportState());
    if(helpWays[0].value==false) {
      helpWays[0].value=value;
    }
      helpWays[1].value=false;
      helpWays[2].value=false;
      helpWays[3].value=false;
      print('index = 0 is :${helpWays[0].value}');
    print('index = 1 is :${helpWays[1].value}');
    print('index = 2 is :${helpWays[2].value}');
    print('index = 3 is :${helpWays[3].value}');
      emit(ChangeHelpWayReportState());
  }
  changeHelpWaysSecondIndexState(var value){
    if(helpWays[1].value==false) {
      helpWays[1].value=value;
    }
      helpWays[0].value=false;
      helpWays[2].value=false;
      helpWays[3].value=false;
      print('index = 1 is :${helpWays[1].value}');
    print('index = 0 is :${helpWays[0].value}');
    print('index = 2 is :${helpWays[2].value}');
    print('index = 3 is :${helpWays[3].value}');
      emit(ChangeHelpWayReportState());

  }
  changeHelpWaysThirdIndexState(var value){
    // helpWays[i].value =! helpWays[i].value;
    // emit(ChangeHelpWayReportState());
    if(helpWays[2].value==false) {
      helpWays[2].value=value;
    }
      helpWays[1].value=false;
      helpWays[0].value=false;
      helpWays[3].value=false;
      print('index = 2 is :${helpWays[2].value}');
    print('index = 1 is :${helpWays[1].value}');
    print('index = 0 is :${helpWays[0].value}');
    print('index = 3 is :${helpWays[3].value}');
      emit(ChangeHelpWayReportState());

  }
  changeHelpWaysLastIndexState(var value){
    // helpWays[i].value =! helpWays[i].value;
    // emit(ChangeHelpWayReportState());
    if(helpWays[3].value==false) {
      helpWays[3].value=value;
    }
      helpWays[1].value=false;
      helpWays[2].value=false;
      helpWays[0].value=false;
      print('index = 3 is :${helpWays[3].value}');
    print('index = 1 is :${helpWays[1].value}');
    print('index = 2 is :${helpWays[2].value}');
    print('index = 0 is :${helpWays[0].value}');
      emit(ChangeHelpWayReportState());

  }
  ////////////////////////////_submit_report_another_person
  String? chooseCountry;
  var country = [
    'المملكه العربيه السعوديه',
    'جمهوريه مصر العربيه',
    'الجزائر',
    'اندونسيا',
    'الكويت',
    'باكستان',
    'تونس',
  ];

  onChangeCountryName(onChange) {
    chooseCountry = onChange;
    emit(ChangeNationalityReportState());
  }
  String? sex;
  var sexList=['ذكر','انثى'];
  onChangeSex(onChange) {
    sex = onChange;
    emit(ChangeNationalityReportState());
  }
}