import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morshed/bloc/add_companions_cubit/state.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/guide_escorts_component.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import '../../bloc/add_companions_cubit/cubit.dart';
import '../../component/info_profile_component.dart';

class AddCompanionsScreen extends StatelessWidget {
  const AddCompanionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addCompanionsCubit = AddCompanionsCubit.get(context);
    return BlocConsumer<AddCompanionsCubit, AddCompanionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: headerOfTechnicalSupport(
                context: context, title: LocaleKeys.addCompanion.tr()),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 10.w, vertical: 20.h),
              child: Stack(
                children: [
                  Column(
                    children: [
                      textFormField(
                          labelText:
                              LocaleKeys.passportIdResidencePermitNumber.tr(),
                          context: context),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: textFormField(
                                isEnabled: false,
                                context: context,
                                labelText:
                                    addCompanionsCubit.convertedDateTime ??
                                        LocaleKeys.leaveDate.tr(),
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
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
                      ),
                      Spacer(),
                      mainButton(
                          text: LocaleKeys.add.tr(),
                          color: darkMainColor,
                          context: context,
                          fct: () {})
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(bottom: 80.h, start: 8.h),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            radius: 34.sp,
                            backgroundColor: Colors.orangeAccent.shade100,
                          ),
                          CircleAvatar(
                            radius: 30.sp,
                            child: SvgPicture.asset('assets/svg/code.svg'),
                            backgroundColor: orangeColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
