import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/add_companions_cubit/state.dart';

class AddCompanionsCubit extends Cubit<AddCompanionsState>{
  AddCompanionsCubit():super(InitialAddCompanionsState());
  static AddCompanionsCubit get(context)=>BlocProvider.of(context);
  String? convertedDateTime;

  chooseDateTime({required BuildContext context}) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(3100));
    if (date != null) {
      print(date);
    }
    convertedDateTime =
    "${date?.year.toString()}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}";
    print(convertedDateTime);
    emit(ChooseDateOfBirthState());
  }
}