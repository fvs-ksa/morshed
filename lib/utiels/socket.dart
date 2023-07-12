// import 'dart:async';
//
// import 'package:geolocator/geolocator.dart';
//
// import '../constant/constant_color.dart';
// import '../models/dynamic_models/login_model.dart';
// import '../models/dynamic_models/profile_model.dart';
// import '../models/dynamic_models/provider_register_model.dart';
// import '../utiels/dio_helper.dart';
//
// final locationClient = Geolocator();
// Timer? timer;
// //late ProfileModel profileModel;
// //late ProviderRegisterModel providerRegisterModel;
// late LoginModel loginModel;
//  startPeriodicUpdates() {
//   timer = Timer.periodic(Duration(seconds: 10), (timer) {
//     Geolocator.getCurrentPosition().then((location) {
//       print('${location.longitude}location.longitude');
//       print('${location.latitude}location.latitude');
//       DioHelper.postData(url: 'https://murshidguide.com/api/providers/1/location',token: token,data: {
//         'latitude':location.latitude,
//         'longitude':location.longitude,
//       }).then((value) {
//         print(value.data);
//       }).catchError((error){});
//       // Send location to backend API
//     }).catchError((e) {
//       print(e);
//     });
//   });
// }

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
//import 'package:background_location/notification.dart' as notif;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../constant/const_color.dart';
import 'dio_helper.dart';
class LocationService {

  late IO.Socket socket;
  late Position currentPosition;
//  final services=FlutterBackgroundService();
  Future<void> start() async {
  //  BackgroundIsolateBinaryMessenger.ensureInitialized;
    socket = IO.io('https://murshidguide.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true
    });
    getProviderData();
    // Socket.connect('https://murshidguide.com', 6001);
    // await Geolocator.requestPermission();
    // Geolocator.getPositionStream().listen((position) {
    //   currentPosition = position;
    //   // backgroundIsolates();
    //
    //
    // });
  }
// void onStart(){
//   WidgetsFlutterBinding.ensureInitialized();
//   final services=FlutterBackgroundService();
//   services.sendData(
//       sendLocationUpdate(),
//     // socket.emit(event);
//     //   socket.emit('sendDataToServer',{
//     //     DioHelper.postData(
//     //         url: 'https://murshidguide.com/api/providers/$id/location',
//     //         token: token,
//     //         data: {
//     //           'latitude': currentPosition.latitude,
//     //           'longitude': currentPosition.longitude,
//     //         }).then((value) {
//     //       print(value.data);
//     //
//     //     }).catchError((e) {})
//     //   })
//   );
//   services.sendData();
//   services.onDataReceived.listen((event){
//
//     print(event);
//
//   });
//   services.setAutoStartOnBootMode(true);
//   services.setForegroundMode(true);
//   services.setNotificationInfo(
//     title: 'مرشد خدمات',
//     content: 'Updated At ${DateTime.now()}',
//   );
// }
  getProviderData() {
    socket.emit('sendDataToServer',{
      DioHelper.getData(
        url: 'https://murshidguide.com/api/pilgrims/getproviders',
        token: token,
        // data: {
        //   'latitude': currentPosition.latitude,
        //   'longitude': currentPosition.longitude,
        // }
      ).then((value) {
        print(value.data);

      }).catchError((e) {})
    });
    socket.connect();
    socket.on('sendLocationResponse', (data) {
      print(data);
    });
    print('${socket.connected}');
    // if (currentPosition != null) {
    //
    //   // print(id);
    // }
  }


  //
  // void _startBackgroundIsolate() async {
  //   // set up a periodic timer to send data every minute
  //   Timer.periodic(Duration(minutes: 1), (timer) async {
  //     // send the data
  //     await sendDataInBackground();
  //
  //
  //   });
  //
  //   // start a background isolate to keep the app running in the background
  //   await BackgroundIsolate().start();
  // }
  void stop() {
    socket.disconnect();
  }

//  const fetchBackground = "fetchBackground";
//   @pragma('vm:entry-point')
//   void callbackDispatcher() {
//     //Workmanager().
//     Workmanager().executeTask((task, inputData) async {
//       // switch (task) {
//       // case fetchBackground:
//       print('/////////////////////////////////////////??????????????????');
//       Position userLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       notif.Notificationss notification = new notif.Notificationss();
//       notification.showNotificationWithoutSound(userLocation);
//       socket.emit('sendDataToServer',{
//         DioHelper.postData(
//             url: 'https://murshidguide.com/api/providers/$id/location',
//             token: token,
//             data: {
//               'latitude': currentPosition.latitude,
//               'longitude': currentPosition.longitude,
//             }).then((value) {
//           print(value.data);
//
//         }).catchError((e) {})
//       });
//       // break;
//       // }
//       return Future.value(true);
//     });
//   }
}


// class LocationService extends FlutterForegroundTask {
//   //static const String SERVICE_NAME = 'location_service';
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   LocationService(this.flutterLocalNotificationsPlugin);
//
//   @override
//
//   // void onStartCommand(intent, flags, startId) {
//   //   var locationOptions = LocationOptions(
//   //     accuracy: LocationAccuracy.high,
//   //     distanceFilter: 10,
//   //   );
//   //   final locationClient = LocationClient(locationOptions);
//   //   locationClient.getCurrentLocation().then((location) {
//   //     // Send location to backend API
//   //   });
//   //   locationClient.onLocationChanged.listen((location) {
//   //     // Send location update to backend API
//   //   });
//   // }
//
// // Rest of service implementation...
// }


