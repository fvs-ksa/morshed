import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/register_cubit/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //Nationality
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
    emit(ChangeNationalityDropDownState());
  }

  //Disability

  String? chooseDisability;
  List<String> disabilities = [
    'سمعيه',
    'بصريه',
    'عقليه',
    'جسميه وحركيه',
  ];

  onChangeDisability(onChange) {
    chooseDisability = onChange;
    emit(ChangeDisabilityDropDownState());
  }

//Residence
  String? chooseResidence;
  List<Map<String, dynamic>> residence = [
    {'id': 1, 'residenceName': 'مكه'},
    {'id': 2, 'residenceName': 'المدينه'}
  ];

  onChangeResidence(onChange) {
    chooseResidence = onChange;
    print('object: $chooseResidence');
    emit(ChangeResidenceDropDownState());
  }

  //chooseDateTime
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

  bool isDisability = false;

  changeDisabilityValue() {
    isDisability = !isDisability;
    emit(ChangeDisabilitySwitchValueState());
  }
}
