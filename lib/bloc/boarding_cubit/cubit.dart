import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:morshed/bloc/boarding_cubit/state.dart';

import '../../models/account_type_model.dart';

class BoardingCubit extends Cubit<BoardingState>{
  BoardingCubit():super(InitialBoardingState());
  static BoardingCubit get(context)=>BlocProvider.of(context);
  bool isLastBoarding=false;
  changeLastBoarding(){
    isLastBoarding = true;
    emit(ChangeBoardingState());
  }
  void initialization()async{
    await Future.delayed(const Duration(milliseconds: 300));
    FlutterNativeSplash.remove();
    emit(RemoveNativeSplashState());
  }
  int i=-1;
  changeTypeOfAccount(int index){
    i=index;
    typeModel[i].isTabbed=!  typeModel[i].isTabbed;
    emit(ChangeAccountTypeState());
  }
}