import 'package:morshed/screen/inner_screen/another_services_screens/guides_screens/about_us_screen.dart';
import 'package:morshed/screen/inner_screen/another_services_screens/guides_screens/guide_to_getting_lost.dart';

import '../component/component.dart';
import '../screen/inner_screen/another_services_screens/guides_screens/haramen_sharefen_services.dart';
import '../screen/inner_screen/another_services_screens/guides_screens/hijj_omra_info.dart';
import '../screen/inner_screen/another_services_screens/guides_screens/tourist_attractions_screen.dart';

class GuidesForHajjiModel{
  String image;
  String title;
  Function fct;
  GuidesForHajjiModel({required this.fct,required this.image,required this.title});
}
List<GuidesForHajjiModel>guidesForHajjiList=[
  GuidesForHajjiModel(fct: (){navigateForward(const AlHarameenAlSharefenServices());}, image: 'assets/images/hajj (1).png', title: 'خدمات الحرمين الشريفين'),
  GuidesForHajjiModel(fct: (){navigateForward(const HijAndOmraInfoScreen());}, image: 'assets/images/umrah.png', title: 'معلومات الحج والعمره'),
  GuidesForHajjiModel(fct: (){navigateForward(const GuideToGettingLostScreen());}, image: 'assets/images/lost.png', title: 'دليل التوهان'),
  GuidesForHajjiModel(fct: (){navigateForward(const AboutUsScreen());}, image: 'assets/images/من نحن.png', title: 'عن مرشد'),
  GuidesForHajjiModel(fct: (){navigateForward(const TouristAttractionsScreen());}, image: 'assets/images/guides.png', title: 'المزارات السياحيه'),
];