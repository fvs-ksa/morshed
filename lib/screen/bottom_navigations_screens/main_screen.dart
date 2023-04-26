import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morshed/bloc/general_cubit/general_cubit.dart';
import 'package:morshed/bloc/general_cubit/general_state.dart';
import 'package:morshed/component/const_color.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var generalCubit=GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit,GeneralState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body:generalCubit.screens[generalCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: darkMainColor,
            onTap: (i){
              generalCubit.changeCurrentScreen(i);
            },
            currentIndex: generalCubit.currentIndex,
            unselectedItemColor: greyColor,
            selectedIconTheme: IconThemeData(color: darkMainColor),
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(generalCubit.currentIndex==0?'assets/svg/home_active.svg':'assets/svg/home.svg'),label: 'الرئيسيه'),
              BottomNavigationBarItem(icon: SvgPicture.asset(generalCubit.currentIndex==1?'assets/svg/notifi_active.svg':'assets/svg/notifi.svg'),label: 'الاشعارات'),
              BottomNavigationBarItem(icon: SvgPicture.asset(generalCubit.currentIndex==2?'assets/svg/qr_active.svg':'assets/svg/qr.svg'),label: 'باركودي'),
              BottomNavigationBarItem(icon: SvgPicture.asset(generalCubit.currentIndex==3?'assets/svg/Group -1.svg':'assets/svg/support.svg'),label: 'سكني ورحلاتي'),
              BottomNavigationBarItem(icon: SvgPicture.asset(generalCubit.currentIndex==4?'assets/svg/more_active.svg':'assets/svg/more.svg'),label: 'المزيد'),

            ],
          ),
        );
      },

    );
  }
}
