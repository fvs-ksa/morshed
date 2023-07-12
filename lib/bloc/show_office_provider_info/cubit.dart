import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:morshed/bloc/show_office_provider_info/state.dart';
import 'package:morshed/utiels/dio_helper.dart';

import '../../models/api_model/get_all_offices.dart';
import '../../models/api_model/provider_model.dart';

class ShowOfficesAndProviderInfoCubit
    extends Cubit<ShowOfficesAndProviderInfoState> {
  ShowOfficesAndProviderInfoCubit() : super(InitialShowDataState());

  static ShowOfficesAndProviderInfoCubit get(context) =>
      BlocProvider.of(context);
  int index = 0;

  changeTabBarIndex({required var value}) {
    index = value;
    emit(ChangeTabBarState());
  }

  late GetAllOffices getAllOffices;
  bool isGetOfficesData=false;
  var myIcon;
  getAllOfficesData() {
    isGetOfficesData=false;
    emit(GetAllOfficesDataLoadingState());
    DioHelper.getData(url: 'https://murshidguide.com/api/getoffices')
        .then((value) {
      print(value.data);
      getAllOffices = GetAllOffices.fromJson(value.data);
      emit(GetAllOfficesDataSuccessState());
      addMarkerOffice();
      isGetOfficesData=true;
    }).catchError((error) {
      print(error.toString());
      emit(GetAllOfficesDataErrorState(error: error.toString()));
    });
  }
  List<Marker> officeMarkers = [];
 // int i=0;
  addMarkerOffice()async{

    for(var data in getAllOffices.offices!)
   // for(i;i<=getAllOffices.offices!.length-2;i++)
    {

     // print();
      final marker= Marker(
        icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10,10)), 'assets/images/marker.png'),
        markerId: MarkerId(data.id.toString()),
        position: LatLng(data.latitude!, data.longitude!),
          //position:LatLng(getAllOffices.offices![i].latitude!, getAllOffices.offices![i].longitude!) ,
        onTap: (){
         changeTapMarker(id: data.id!);
         // changeTapMarker(id: i);
         // print('i: $i');

        }

      );
      officeMarkers.add(marker);
    //  print('index Galal $i');
     // i++;
    }
    emit(FullMarkListState());
  }
  int tabbed=00;
  int? indexsss;
  changeTapMarker({required int id,}){
    indexsss=getAllOffices.offices!.indexWhere((element) =>element.id==id);
    print('indexx $indexsss');
    tabbed=id;
  //  print('iiiiiiiiiiii $i');
  //  print(getAllOffices.offices!.indexOf(getAllOffices.offices!.indexWhere((element) => element.id!)));
    print('tabbed $tabbed');
   // print('id ${getAllOffices.offices![i].id}');
    emit(ChangeTabbedMarkerState());
  }
 // late GetProvidersModel getProvidersModel;
 // Stream<GetProvidersModel> getAllProvidersData() {
 //    isGetOfficesData=false;
 //    emit(GetAllOfficesDataLoadingState());
 //    DioHelper.getData(url: 'https://murshidguide.com/api/getoffices')
 //        .then((value) {
 //      print(value.data);
 //      getAllOffices = GetAllOffices.fromJson(value.data);
 //      emit(GetAllOfficesDataSuccessState());
 //      addMarkerOffice();
 //      isGetOfficesData=true;
 //    }).catchError((error) {
 //      print(error.toString());
 //      emit(GetAllOfficesDataErrorState(error: error.toString()));
 //    });
 //   return GetProvidersModel;
 //  }



}
