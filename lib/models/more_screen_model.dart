

import 'package:morshed/component/component.dart';
import 'package:morshed/screen/inner_screen/guides_screen.dart';
import 'package:morshed/screen/inner_screen/profile_screen.dart';

class MoreScreenModel{
  String title;
  Function onTap;
  String svgImage;
  MoreScreenModel({required this.title,required this.onTap,required this.svgImage});
}
List<MoreScreenModel> moreList=[
  MoreScreenModel(title: 'الحساب', onTap: (){navigateForward(const ProfileScreen());}, svgImage: 'assets/svg/profile.svg'),
  MoreScreenModel(title: 'المرشدين', onTap: (){navigateForward(const GuidesScreen());}, svgImage: 'assets/svg/file (-1.svg'),
  MoreScreenModel(title: 'المرافقين', onTap: (){}, svgImage: 'assets/svg/Group -1.svg'),
  MoreScreenModel(title: 'بلاغاتي', onTap: (){}, svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(title: 'سكني ورحلاتي', onTap: (){}, svgImage: 'assets/svg/me.svg'),
  MoreScreenModel(title: 'التواصل', onTap: (){}, svgImage: 'assets/svg/end call-1.svg'),
  MoreScreenModel(title: 'الشروط والأحكام', onTap: (){}, svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(title: 'الاعدادات', onTap: (){}, svgImage: 'assets/svg/settings.svg'),
  MoreScreenModel(title: 'شارك مرشد', onTap: (){}, svgImage: 'assets/svg/share.svg'),
];
