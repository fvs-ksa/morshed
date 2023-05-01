import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/account_type_cubit/cubit.dart';
import 'package:morshed/bloc/account_type_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/const_color.dart';
import 'package:morshed/screen/auth_screen/login_screen.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';
import '../../component/animation_component.dart';
import '../../component/navigation_functions.dart';
import '../../models/account_type_model.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var accountTypeCubit=AccountTypeCubit.get(context);
    return BlocConsumer<AccountTypeCubit,AccountTypeState>(
      listener:(context,state){},
      builder: (context,state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/4.png',
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: size.height * 0.1,bottom: size.height * 0.09),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/whiteMorshed.png',
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      'اختر صفه التسجيل',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: typeModel.length,
                        itemBuilder: (context, index) {
                          return accountType(
                            fct: (onChange){
                              if(index==0){
                                accountTypeCubit.changeMotamer(value: onChange);
                              }else{
                                accountTypeCubit.changeHajji(value: onChange);
                              }
                            },
                              context: context, model: typeModel[index],
                              checkBoxValue: index==0?accountTypeCubit.isUmrah:accountTypeCubit.isHajji);
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox();
                          // return  Padding(
                          //   padding:  EdgeInsets.only(horizontal: size.width*0.02),
                          //   child: DashedLine(color: whiteColor,),
                          // );
                          // return CustomPaint(
                          //     size: Size(1, double.infinity),
                          //     painter: DashedLineVerticalPainter(),
                          // );
                        },
                      ),
                    ),
                    const Spacer(),
                    floatingButton(context: context, fct: (){
                      if(accountTypeCubit.isHajji==false && accountTypeCubit.isUmrah ==false){
                        showToast(text: 'من فضلك اختار نوع التسجيل', state: ToastState.WARNING);
                        print('hijji: ${accountTypeCubit.isHajji} || Umrah: ${accountTypeCubit.isUmrah}');
                      }else{
                        navigateForward(LoginScreen());
                        print('hijji: ${accountTypeCubit.isHajji} || Umrah: ${accountTypeCubit.isUmrah}');
                      }
                    },iconColor: lightMainColor,backgroundColor: whiteColor)
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}