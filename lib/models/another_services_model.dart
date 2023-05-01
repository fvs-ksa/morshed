import 'package:morshed/component/component.dart';
import 'package:morshed/screen/inner_screen/another_services_screens/transportation_screen.dart';

import '../component/navigation_functions.dart';
import '../screen/inner_screen/another_services_screens/guides_screens/guides_for_hajji_screen.dart';

class AnotherServicesModel{
  String image;
  String title;
  Function fct;
  AnotherServicesModel({required this.title,required this.fct,required this.image});
}
List<AnotherServicesModel>anotherServicesList=[
  AnotherServicesModel(title: 'إرشادات', fct: (){navigateForward(const GuidesForHajjiScreen());}, image: 'assets/images/guides.png'),
  AnotherServicesModel(title: 'وسائل النقل', fct: (){navigateForward(const TransportationScreen());}, image: 'assets/images/bus.png'),
  AnotherServicesModel(title: 'الصلوات', fct: (){}, image: 'assets/images/hajj (1).png'),
  AnotherServicesModel(title: 'التسويق والترفيه', fct: (){}, image: 'assets/images/guides.png'),
];
