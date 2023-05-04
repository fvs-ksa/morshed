import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/setting_cubit/cubit.dart';
import 'package:morshed/bloc/setting_cubit/state.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/translation/locale_keys.g.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    var settingCubit=SettingCubit.get(context);
    return BlocConsumer<SettingCubit,SettingState>(
      listener: (context,state){},
      builder: (context,state) {
        {
          return Scaffold(
            appBar: preferredHeaderWithGuide(
                context: context, title: LocaleKeys.settings.tr(), isActive: false),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: screenSize.width * 0.02,
                  vertical: screenSize.width * 0.04),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: screenSize.width * 0.03),
                    height: screenSize.height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor,),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.language.tr(), style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2,),
                        Row(
                          children: [
                            Text('Ar', style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,),
                            Switch.adaptive(
                                inactiveThumbColor: darkMainColor,
                                inactiveTrackColor: whiteGreyColor,
                                activeColor: orangeColor,
                                activeTrackColor: whiteGreyColor,
                                value: settingCubit.isEnglish,
                                onChanged: (onChange) {
                                  settingCubit.changeLanguage();
                                }),
                            Text('En', style: Theme
                                .of(context)
                                .textTheme
                                .headline6,)
                          ],
                        )
                      ],),
                  ),
                  SizedBox(height: screenSize.height*0.04,),
                  TextButton( onPressed: () {  }, child: Text(LocaleKeys.deleteAccount.tr(),style: Theme.of(context).textTheme.headline4,),)
                ],
              ),
            ),
          );
        }
      }
    );
  }
}
