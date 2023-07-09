import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/login_cubit/login_state.dart';
import 'package:morshed/component/animation_component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/models/api_model/profile_model.dart';
import 'package:morshed/utiels/dio_helper.dart';
import 'package:morshed/utiels/shared_pref.dart';
import '../../component/navigation_functions.dart';
import '../../models/api_model/login_model.dart';
import '../../screen/bottom_navigations_screens/main_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;
  bool isVisable=true;
  void changeVisabilityState() {
    isVisable = !isVisable;
    emit(ChangeVisabilityState());
  }
  userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'https://murshidguide.com/api/pilgrims/login',
        data: {
          'password': password,
          'email': email,
        }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      token = CacheHelper.saveData(key: 'token', value: loginModel.token!);
     // fcmToken=CacheHelper.saveData(key: 'fcmToken', value: loginModel.user.to)
      emit(LoginSuccessState());
      navigateForwardReplace(MainScreen());
      sendFcmToken();
     // getProfileDate();
    }).catchError((error) {
      print(error.toString());
      showToast(text: 'برجاء التأكد من البيانات المدخله', state: ToastState.ERROR);
      emit(LoginErrorState(error: error.toString()));
    });
  }
  late ProfileModel profileModel;
getProfileDate(){
    emit(GetProfileLoadingState());
    DioHelper.getData(url: 'https://murshidguide.com/api/pilgrims/show',token: token).then((value) {
      print(value.data);
      profileModel=ProfileModel.fromJson(value.data);
      emit(GetProfileSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetProfileErrorState(error: error.toString()));
    });
  }
  sendFcmToken() {
    emit(SendFcmTokenLoadingState());
    DioHelper.postData(url: 'https://murshidguide.com/api/pilgrims/fcm-token', data: {
      'fcm_token': fcmToken,
    },
        token: CacheHelper.getData(key: 'token')
    ).then((value) {
      print(value.data);

      emit(SendFcmTokenSuccessState());
    //  getProfileDate();
    }).catchError((error) {
      print(error.toString());
      emit(SendFcmTokenErrorState(error: error.toString()));
    });
  }

  // late ProfileModel profileModel;
  //
  // getProfileDate() {
  //   emit(GetProfileLoadingState());
  //   DioHelper.getData(
  //           url: 'https://murshidguide.com/api/pilgrims/${loginModel.user!.id}',
  //           token: token)
  //       .then((value) {
  //     print(value.data);
  //     profileModel = ProfileModel.fromJson(value.data);
  //     emit(GetProfileSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetProfileErrorState(error: error.toString()));
  //   });
  // }
}
