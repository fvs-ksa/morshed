import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/profile_cubit/state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/screen/borading_screen/boarding_screen.dart';

import '../../constant/const_color.dart';
import '../../models/api_model/profile_model.dart';
import '../../utiels/dio_helper.dart';
import '../../utiels/shared_pref.dart';
import 'dart:io';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  String? chooseNationality;
  var nationality = [
    "أفغاني",
    "ألباني",
    "جزائري",
    "أمريكي",
    "أندوري",
    "أنغولي",
    "انتيغوا",
    "أرجنتيني",
    "أرميني",
    "أسترالي",
    "نمساوي",
    "أذربيجاني",
    "باهامى",
    "بحريني",
    "بنجلاديشي",
    "باربادوسي",
    "بربودا",
    "بوتسواني",
    "بيلاروسي",
    "بلجيكي",
    "بليزي",
    "بنيني",
    "بوتاني",
    "بوليفي",
    "بوسني",
    "برازيلي",
    "بريطاني",
    "بروناى",
    "بلغاري",
    "بوركيني",
    "بورمي",
    "بوروندي",
    "كمبودي",
    "كاميروني",
    "كندي",
    "االرأس الأخضر",
    "وسط أفريقيا",
    "تشادي",
    "شيلي",
    "صينى",
    "كولومبي",
    "جزر القمر",
    "كونغولي",
    "كوستاريكي",
    "كرواتية",
    "كوبي",
    "قبرصي",
    "تشيكي",
    "دانماركي",
    "جيبوتي",
    "دومينيكاني",
    "هولندي",
    "تيموري شرقي",
    "اكوادوري",
    "مصري",
    "إماراتي",
    "غيني  استوائي",
    "إريتري",
    "إستوني",
    "حبشي",
    "فيجي",
    "فلبيني",
    "فنلندي",
    "فرنسي",
    "جابوني",
    "غامبيي",
    "جورجي",
    "ألماني",
    "غاني",
    "إغريقي",
    "جرينادي",
    "غواتيمالي",
    "غيني بيساوي",
    "غيني",
    "جوياني",
    "هايتي",
    "هرسكي",
    "هندوراسي",
    "هنغاري",
    "إيسلندي",
    "هندي",
    "إندونيسي",
    "إيراني",
    "عراقي",
    "إيرلندي",
    "إيطالي",
    "إفواري",
    "جامايكي",
    "ياباني",
    "أردني",
    "كازاخستاني",
    "كيني",
    "كيتياني ونيفيسياني",
    "كويتي",
    "قيرغيزستان",
    "لاوسي",
    "لاتفي",
    "لبناني",
    "ليبيري",
    "ليبي",
    "ليختنشتايني",
    "لتواني",
    "لكسمبرغي",
    "مقدوني",
    "مدغشقري",
    "مالاوى",
    "ماليزي",
    "مالديفي",
    "مالي",
    "مالطي",
    "مارشالي",
    "موريتاني",
    "موريشيوسي",
    "مكسيكي",
    "ميكرونيزي",
    "مولدوفي",
    "موناكو",
    "منغولي",
    "مغربي",
    "ليسوتو",
    "لتسواني",
    "موزمبيقي",
    "ناميبي",
    "ناورو",
    "نيبالي",
    "نيوزيلندي",
    "ني فانواتي",
    "نيكاراغوا",
    "نيجري",
    "كوري شمالي",
    "إيرلندي شمالي",
    "نرويجي",
    "عماني",
    "باكستاني",
    "بالاوي",
    "فلسطيني",
    "بنمي",
    "بابوا غينيا الجديدة",
    "باراغواياني",
    "بيروفي",
    "بولندي",
    "برتغالي",
    "قطري",
    "روماني",
    "روسي",
    "رواندي",
    "لوسياني",
    "سلفادوري",
    "ساموايان",
    "سان مارينيز",
    "ساو توميان",
    "سعودي",
    "سكتلندي",
    "سنغالي",
    "صربي",
    "سيشلي",
    "سيرا ليوني",
    "سنغافوري",
    "سلوفاكي",
    "سلوفيني",
    "جزر سليمان",
    "صومالي",
    "جنوب افريقيي",
    "كوري جنوبي",
    "إسباني",
    "سري لانكي",
    "سوداني",
    "سورينامي",
    "سوازي",
    "سويدي",
    "سويسري",
    "سوري",
    "تايواني",
    "طاجيكي",
    "تنزاني",
    "التايلاندي",
    "توغواني",
    "تونجاني",
    "ترينيدادي أو توباغوني",
    "تونسي",
    "تركي",
    "توفالي",
    "أوغندي",
    "أوكراني",
    "أوروجواي",
    "أوزبكستاني",
    "فنزويلي",
    "فيتنامي",
    "ويلزي",
    "يمني",
    "زامبي",
    "زيمبابوي"
  ];

  onChangeCountryName(onChange) {
    chooseNationality = onChange;
    emit(ChangeNationalityDropDownProfileState());
  }

  String? convertedDateTime;
  DateTime? dateTime;

  chooseDateTime({required BuildContext context}) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime.now(),
        lastDate: DateTime(3100));
    if (date != null) {
      print(date);
      dateTime=date;
    }
    convertedDateTime =
    "${date?.year.toString()}-${date?.month.toString().padLeft(2, '0')}-${date
        ?.day.toString().padLeft(2, '0')}";
    print(convertedDateTime);
    emit(ChooseDateOfBirthProfileState());
  }

  late ProfileModel profileModel;
  bool isLoading = false;

  getProfileDate() {
    isLoading = false;
    emit(GetProfileLoadingState());
    DioHelper.getData(
        url: 'https://murshidguide.com/api/pilgrims/show',
        token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      isLoading = true;
      emit(GetProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState(error: error.toString()));
    });
  }

  updateUserInfo({
    required String nameAr,
    required String nameEn,
    required String phone,
   String? birthDate,
   String? nationality,
     String? locationMenna,
    required String email,
    required String passport,
    required String visaNo,
   String? borderNo,
     String? agentName,
     File? image }) {
    emit(UpdateProfileLoadingState());
    // DateTime birth=DateTime.parse(profileModel.data!.birthdate!);
    // DateTime arrival=DateTime.parse(profileModel.data!.birthdate!);
    // DateTime dapuration=DateTime.parse(profileModel.data!.departureDate!);
    DioHelper.postData(
      data: {
        "name_en":nameEn,
        "name_ar":nameAr,
        "phone_number":phone,
        'nationality':chooseNationality??profileModel.data!.nationality!,
        "birthdate":dateTime??DateTime.parse(profileModel.data!.birthdate!),
        'email':email,
        'visa_number':visaNo,
        'passport_number':passport,
        'border_number':borderNo,
        "arrival_date":DateTime.parse(profileModel.data!.arrivalDate!),
        "departure_date":DateTime.parse(profileModel.data!.departureDate!),
        "location_mina":profileModel.data!.locationMina!,
        'location_mozdalifa':profileModel.data!.locationMozdalifa!,
        'location_arfat':profileModel.data!.locationArfat!,
        'agent_name':agentName,

        //"image":image,
      },
            url:
                'https://murshidguide.com/api/pilgrims/update/${profileModel.data!.id}',
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data);
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileErrorState(error: error.toString()));
    });
  }
  logOut() {
    emit(LogOutLoadingState());
    DioHelper.postData(
        url: 'https://murshidguide.com/api/pilgrims/logout', token: CacheHelper.getData(key: 'token'))
        .then((value) {
          print(value.data);
          CacheHelper.removeData();
          emit(LogOutSuccessState());
          navigateForwardReplace(BoardingScreen());
          print('REMOVE TOKEN IS ${CacheHelper.getData(key: 'token')}');
    }

    )
        .catchError((error) {
      print(error.toString());
      emit(LogOutErrorState(error: error.toString()));
      showToast(text: 'فشل في تسجيل الخروج', state: ToastState.ERROR);
    });
  }
}
