import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/profile_cubit/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  String? chooseNationality;
  var nationality = [
    'سعودي',
    'مصري',
    'جزائري',
    'اندونيسي',
    'كويتي',
    'عراقي',
    'تونسي',
  ];

  onChangeCountryName(onChange) {
    chooseNationality = onChange;
    emit(ChangeNationalityDropDownProfileState());
  }

  String? convertedDateTime;

  chooseDateTime({required BuildContext context}) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime.now(),
        lastDate: DateTime(3100));
    if (date != null) {
      print(date);
    }
    convertedDateTime =
        "${date?.year.toString()}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}";
    print(convertedDateTime);
    emit(ChooseDateOfBirthProfileState());
  }
}
