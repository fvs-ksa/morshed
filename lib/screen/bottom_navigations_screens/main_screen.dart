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
          body:generalCubit.screens[generalCubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: darkMainColor,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/'))
            ],
          ),
        );
      },

    );
  }
}
