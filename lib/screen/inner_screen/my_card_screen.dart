import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morshed/bloc/profile_cubit/cubit.dart';
import 'package:morshed/bloc/profile_cubit/state.dart';
import 'package:morshed/translation/locale_keys.g.dart';

import '../../component/animation_component.dart';
import '../../component/guide_escorts_component.dart';
import '../../constant/const_color.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileCubit=ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit,ProfileState>(
      listener: (context,state){},
      builder: (context,state) {
        return Scaffold(
          appBar: headerOfTechnicalSupport(
              context: context, title: LocaleKeys.myCard.tr()),
          body:state is GetProfileLoadingState?Center(child: CircularProgressIndicator(),): Column(
            children: [
              cardIdWidget(model: profileCubit.profileModel, context: context),
              // Container(
              //   padding: EdgeInsetsDirectional.symmetric(vertical: 16.h,horizontal: 16.w),
              //
              //   child: Container(
              //     height: 150,
              //     width:double.infinity,
              //     decoration: BoxDecoration(
              //       color: darkMainColor,
              //       borderRadius: BorderRadius.circular(25),
              //
              //     ),
              //     child: Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              //         child: Column(
              //           children: [
              //             Row(children: [
              //               CircleAvatar(backgroundImage: NetworkImage(profileCubit.profileModel.data!.image!),radius: 30,),
              //               SizedBox(width: 10,),
              //               Text(profileCubit.profileModel.data!.nameAr!,style: Theme.of(context).textTheme.labelMedium,),
              //               Spacer(),
              //               Container(
              //                   height: 60,
              //                   width: 60,
              //                   child: FittedBox(child: Image.network(profileCubit.profileModel.data!.qrCode!)))
              //             ],),
              //             SizedBox(height: 7,),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(profileCubit.profileModel.data!.nationality!,style: Theme.of(context).textTheme.labelMedium,),
              //                 Text(profileCubit.profileModel.data!.arrivalDate!,style: Theme.of(context).textTheme.labelMedium,)
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(profileCubit.profileModel.data!.agentName!,style: Theme.of(context).textTheme.labelMedium,),
              //                 Text(profileCubit.profileModel.data!.departureDate!,style: Theme.of(context).textTheme.labelMedium,)
              //               ],
              //             )
              //
              //           ],
              //         ),
              //       ),
              //     ),
              //   )
              // ),
            ],
          ),
        );
      }
    );
  }
}
