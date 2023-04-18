

import 'package:morshed/component/component.dart';
import 'package:morshed/screen/inner_screen/escorts_screen.dart';
import 'package:morshed/screen/inner_screen/guides_screen.dart';
import 'package:morshed/screen/inner_screen/profile_screen.dart';
import 'package:morshed/screen/inner_screen/setting_screen.dart';

import '../screen/inner_screen/contaxt_us.dart';
import '../screen/inner_screen/my_reports/my_reports.dart';

class MoreScreenModel{
  String title;
  Function onTap;
  String svgImage;
  MoreScreenModel({required this.title,required this.onTap,required this.svgImage});
}
List<MoreScreenModel> moreList=[
  MoreScreenModel(title: 'الحساب', onTap: (){navigateForward(const ProfileScreen());}, svgImage: 'assets/svg/profile.svg'),
  MoreScreenModel(title: 'المرشدين', onTap: (){navigateForward(GuidesScreen());}, svgImage: 'assets/svg/file (-1.svg'),
  MoreScreenModel(title: 'المرافقين', onTap: (){navigateForward(EscortsScreen());}, svgImage: 'assets/svg/Group -1.svg'),
  MoreScreenModel(title: 'بلاغاتي', onTap: (){navigateForward(const MyReports());}, svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(title: 'سكني ورحلاتي', onTap: (){}, svgImage: 'assets/svg/me.svg'),
  MoreScreenModel(title: 'التواصل', onTap: (){navigateForward(const ContactUs());}, svgImage: 'assets/svg/end call-1.svg'),
  MoreScreenModel(title: 'الشروط والأحكام', onTap: (){}, svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(title: 'الإعدادات', onTap: (){navigateForward(const SettingScreen());}, svgImage: 'assets/svg/settings.svg'),
  MoreScreenModel(title: 'شارك مرشد', onTap: (){}, svgImage: 'assets/svg/share.svg'),
];