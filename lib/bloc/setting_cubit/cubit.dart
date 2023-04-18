import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/setting_cubit/state.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit():super(InitialSettingState());
  static SettingCubit get(context)=>BlocProvider.of(context);
  bool isEnglish=false;
  changeLanguage(){
    isEnglish =!isEnglish;
    emit(ChangeLanguageState());
  }
}