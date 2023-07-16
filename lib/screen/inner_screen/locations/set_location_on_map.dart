import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:morshed/bloc/location_cubit/cubit.dart';
import 'package:morshed/bloc/register_cubit/state.dart';
import 'package:morshed/component/navigation_functions.dart';
import 'package:morshed/constant/const_color.dart';
import 'package:morshed/screen/auth_screen/register_Screen.dart';

import '../../../bloc/register_cubit/cubit.dart';
import '../../../component/component.dart';
import '../../../component/cutom_text_filed.dart';

class MapScreenForSetLocation extends StatefulWidget {
  int i;

  MapScreenForSetLocation({required this.i});

  @override
  State<MapScreenForSetLocation> createState() =>
      _MapScreenForSetLocationState();
}

class _MapScreenForSetLocationState extends State<MapScreenForSetLocation> {
  TextEditingController locationName = TextEditingController();

  GoogleMapController? mapController;

  CameraPosition? cameraPositions;

  // MapScreenForSetLocation({required this.locationName});
  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(widget.i == 0
                  ? 'تحديد موقع مخيم منى'
                  : widget.i == 1
                      ? 'تحديد موقع مخيم عرفه'
                      : widget.i == 2
                          ? 'تحديد موقع مخيم المزدلفه'
                          : widget.i == 3
                              ? 'تحديد موقع البلاغ'
                              : widget.i == 4
                                  ? 'تحديد موقع الفندق في مكه المكرمه'
                                  : 'تحديد موقع الفندق في المدينه المنوره',style: TextStyle(color: whiteColor),),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      // if(widget.i==3){
                      //   LocationCubit.get(context).getStringAddress(widget.i);
                      //   Navigator.of(context).pop();
                      //   print('location report ${reportLocation}');
                      // }else{
                      cubit.getStringAddress(widget.i);
                      // Navigator.pop(context);
                      Navigator.of(context).pop();
                      // navigateForwardReplace(RegisterScreen());
                      print(lat);
                      print('location report ${reportLocation}');
                      print('meenaLoc${meenaLoc}');
                      print('arafaLoc${arafaLoc}');
                      print('MinaLat ${latMinna}');
                      print('MinaLng${lngMinna}');
                      print('ArafaLat${latArafa}');
                      print('ArafaLang${lngArafa}');
                      print('MozdalifaLat${latMozdalifa}');
                      print('MozdalifaLng${lngMozdalifa}');
                      print(widget.i);
                      //}
                    },
                    icon:  Icon(Icons.check,color: whiteColor,))
              ],
            ),
            body: state is GetUserCurrentLocation ||
                    cubit.position?.latitude == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: babyBlueColor,
                  ))
                : Stack(
                    children: [
                      GoogleMap(
                        // onMapCreated: (googleController) {
                        // // cubit.changeMapMode(googleController);
                        // },
                        onCameraMove: (CameraPosition cameraPosition) {
                          cameraPositions = cameraPosition;
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(cubit.position!.latitude,
                                cubit.position!.longitude),
                            zoom: 16),
                        onCameraIdle: () async {
                          cubit.getLocationFromMap(cameraPositions);
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        buildingsEnabled: false,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/marker.png',
                          width: size.width * 0.09,
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp)),
                        elevation: 3,
                        child: Container(
                          height: size.height * 0.09,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.sp),
                                  topLeft: Radius.circular(15.sp))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 1.3.h, left: 1.3.w, right: 1.3.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  controller: locationName,
                                  labelText: cubit.addressFromMap.isEmpty
                                      ? ''
                                      : cubit.addressFromMap,
                                  // hitText: 'الموقع',
                                  // enabled: false
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                // SizedBox(
                                //   height: size.height > 1000.h
                                //       ? 8.h
                                //       : size.height * 0.04,
                                //   child: ListView.separated(
                                //       scrollDirection: Axis.horizontal,
                                //       itemBuilder: (context, index) {
                                //         return GestureDetector(
                                //           onTap: () {
                                //             cubit.selectedDescriptionPlace(
                                //                 index);
                                //             debugPrint(
                                //                 description[index].title);
                                //           },
                                //           child: Container(
                                //             padding: EdgeInsets.all(5.sp),
                                //             decoration: BoxDecoration(
                                //                 borderRadius:
                                //                 BorderRadius.circular(
                                //                     15.sp),
                                //                 border: Border.all(
                                //                     color:
                                //                     cubit.selectedIndex ==
                                //                         index
                                //                         ? blueColor
                                //                         : Colors
                                //                         .transparent)),
                                //             child: Row(
                                //               children: [
                                //                 Text(
                                //                   description[index].title,
                                //                   style: Theme.of(context)
                                //                       .textTheme
                                //                       .displayMedium,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 2.sp,
                                //                 ),
                                //                 Icon(
                                //                   description[index].icon,
                                //                   color: darkBlue,
                                //                   size: size.height > 1000
                                //                       ? 12.sp
                                //                       : 10.sp,
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         );
                                //       },
                                //       separatorBuilder: (context, index) {
                                //         return SizedBox(
                                //           width: 3.w,
                                //         );
                                //       },
                                //       itemCount: description.length),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
