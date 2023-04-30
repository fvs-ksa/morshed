import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/escorts_cubit/state.dart';

class EscortsCubit extends Cubit<EscortsState>{
  EscortsCubit():super(InitialEscortsState());
  static EscortsCubit get(context)=>BlocProvider.of(context);
  String? flag;
  List flags=[
    '','','',
  ];
}