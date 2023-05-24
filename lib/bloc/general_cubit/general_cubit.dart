import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/general_cubit/general_state.dart';
import 'package:morshed/screen/bottom_navigations_screens/home_screen.dart';
import 'package:morshed/screen/bottom_navigations_screens/more_screen.dart';
import 'package:morshed/screen/bottom_navigations_screens/notification_screen.dart';
import 'package:morshed/screen/bottom_navigations_screens/qr_screen.dart';
import '../../screen/bottom_navigations_screens/my_residence_and_travels.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(InitialGeneralState());

  static GeneralCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const QrScreen(),
    const MyResidenceAndTravels(),
    //SupportScreen(),
    const MoreScreen(),
  ];
  int currentIndex = 0;

  changeCurrentScreen(int i) {
    currentIndex = i;
    emit(ChangeBottomNavigationBarState());
  }
}
