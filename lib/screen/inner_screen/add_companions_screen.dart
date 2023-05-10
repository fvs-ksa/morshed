import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/add_companions_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/add_companions_cubit/cubit.dart';
import '../../component/floating_Container.dart';
import '../../component/info_profile_component.dart';
import '../../component/navigation_functions.dart';

class AddCompanionsScreen extends StatelessWidget {
  const AddCompanionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    var addCompanionsCubit=AddCompanionsCubit.get(context);
    return BlocConsumer<AddCompanionsCubit,AddCompanionsState>(
      listener: (context,state){},

      builder: (context,state){
        return Scaffold(
          appBar: headerOfTechnicalSupport(context: context, title: LocaleKeys.addCompanion.tr()),
          body: Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal: screenSize.width*0.05,vertical: screenSize.height*0.04),
            child: Stack(
              children: [
                Column(
                  children: [
                    textFormField(labelText: LocaleKeys.passportIdResidencePermitNumber.tr(), context: context),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: textFormField(
                            isEnabled: false,
                            context: context,
                            labelText:
                            addCompanionsCubit.convertedDateTime ??
                                LocaleKeys.leaveDate.tr(),
                            // hintText:registerCubit.convertedDateTime?? 'تاريخ المغادره',
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.07,
                        ),
                        GestureDetector(
                          onTap: () async {
                            addCompanionsCubit.chooseDateTime(
                                context: context);
                          },
                          child: decorationContainerWidget(
                              context: context,
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/svg/Calendar.svg')),
                              radius: 35.sp),
                        ),
                      ],
                    ),
                    Spacer(),
                    mainButton(width: screenSize.width*0.8, height: screenSize.height*0.06,
                        text: LocaleKeys.add.tr(), color: darkMainColor, context: context, fct: (){})
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Padding(
                    padding:EdgeInsetsDirectional.only(bottom: screenSize.height*0.08,start: screenSize.width*0.02),
                    child: Stack(
                      alignment: AlignmentDirectional.center,

                      children: [
                        CircleAvatar(
                          radius: screenSize.width*0.08,
                         // child: SvgPicture.asset('assets/svg/code.svg'),
                          backgroundColor: Colors.orangeAccent.shade100,
                         // foregroundColor:orangeColor ,
                        ),
                        CircleAvatar(
                          radius: screenSize.width*0.07,
                          child: SvgPicture.asset('assets/svg/code.svg'),
                          backgroundColor: orangeColor,
                          //foregroundColor:orangeColor ,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
