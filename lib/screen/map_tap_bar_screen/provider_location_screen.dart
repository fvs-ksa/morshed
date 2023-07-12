import 'package:barcode_scan2/gen/protos/protos.pb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:morshed/bloc/location_cubit/cubit.dart';
import 'package:morshed/bloc/location_cubit/state.dart';
import 'package:morshed/bloc/show_office_provider_info/cubit.dart';
import 'package:morshed/bloc/show_office_provider_info/state.dart';

import '../../utiels/stream_controller.dart';

class ProvidersLocationScreen extends StatefulWidget {
  const ProvidersLocationScreen({super.key});

  @override
  State<ProvidersLocationScreen> createState() => _ProvidersLocationScreenState();
}

class _ProvidersLocationScreenState extends State<ProvidersLocationScreen> {
  final MyApiDataSource _dataSource = MyApiDataSource();
  GoogleMapController? mapController;

  CameraPosition? cameraPositions;
  @override
  void initState() {
    super.initState();
    _dataSource.startListening();
  }

  @override
  void dispose() {
    _dataSource.stopListening();
    super.dispose();
  }
  // var icon;
  // @override
  // void initState() {
  //   ShowOfficesAndProviderInfoCubit.get(context).addMarker();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    var locationCubit = LocationCubit.get(context);
    var showDataCubit = ShowOfficesAndProviderInfoCubit.get(context);
    return BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state)async {

        },
        builder: (context, state)  {
          return BlocConsumer<ShowOfficesAndProviderInfoCubit,
              ShowOfficesAndProviderInfoState>(
              listener: (context, state) {},
            //  bloc: showDataCubit.getAllOfficesData(),
              builder: (context, state) {
                //  showDataCubit.addMarker();
                return StreamBuilder(
                  stream:_dataSource.dataStream ,
                  builder: (context,snapShot) {
                    if(snapShot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return Scaffold(
                        body: locationCubit.position?.latitude == null
                            ? Center(child: CircularProgressIndicator())
                            : GoogleMap(
                          gestureRecognizers: Set()
                            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
                          onCameraMove: (CameraPosition cameraPosition) {
                            cameraPositions = cameraPosition;
                          },
                          initialCameraPosition: CameraPosition(
                              zoom: 12,
                              target: LatLng(locationCubit.position!.latitude,
                                  locationCubit.position!.longitude)),
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          myLocationEnabled: true,
                          // myLocationButtonEnabled: true,
                          // buildingsEnabled: true,
                          // compassEnabled: true,
                          markers: Set<Marker>.of(_dataSource.providerMarkers),
                        ),
                      );
                    }

                  }
                );
              });
        });
  }
}
