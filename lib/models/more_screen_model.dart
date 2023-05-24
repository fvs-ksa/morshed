import 'package:easy_localization/easy_localization.dart';
import 'package:morshed/screen/inner_screen/companions_screen.dart';
import 'package:morshed/screen/inner_screen/guides_screen.dart';
import 'package:morshed/screen/inner_screen/my_card_screen.dart';
import 'package:morshed/screen/inner_screen/profile_screen.dart';
import 'package:morshed/screen/inner_screen/setting_screen.dart';

import '../component/navigation_functions.dart';
import '../screen/inner_screen/contact_us.dart';
import '../screen/inner_screen/my_reports/my_reports.dart';
import '../screen/inner_screen/support_screen.dart';
import '../translation/locale_keys.g.dart';

class MoreScreenModel {
  String title;
  Function onTap;
  String svgImage;

  MoreScreenModel(
      {required this.title, required this.onTap, required this.svgImage});
}

List<MoreScreenModel> moreList = [
  MoreScreenModel(
      title: LocaleKeys.profile.tr(),
      onTap: () {
        navigateForward(const ProfileScreen());
      },
      svgImage: 'assets/svg/profile.svg'),
  MoreScreenModel(
      title: LocaleKeys.guides.tr(),
      onTap: () {
        navigateForward(GuidesScreen());
      },
      svgImage: 'assets/svg/file (-1.svg'),
  MoreScreenModel(
      title: LocaleKeys.Companions.tr(),
      onTap: () {
        navigateForward(EscortsScreen());
      },
      svgImage: 'assets/svg/Group -1.svg'),
  MoreScreenModel(
      title: LocaleKeys.myReports.tr(),
      onTap: () {
        navigateForward(const MyReports());
      },
      svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(
      title: LocaleKeys.myCard.tr(),
      onTap: () {
        navigateForward(const MyCardScreen());
      },
      svgImage: 'assets/svg/Icon awesome-id-card.svg'),
  MoreScreenModel(
      title: LocaleKeys.technicalSupport.tr(),
      onTap: () {
        navigateForward(SupportScreen());
      },
      svgImage: 'assets/svg/support.svg'),
  MoreScreenModel(
      title: LocaleKeys.contactUs.tr(),
      onTap: () {
        navigateForward(const ContactUs());
      },
      svgImage: 'assets/svg/end call-1.svg'),
  MoreScreenModel(
      title: LocaleKeys.privacyPolicy.tr(),
      onTap: () {},
      svgImage: 'assets/svg/file (1).svg'),
  MoreScreenModel(
      title: LocaleKeys.settings.tr(),
      onTap: () {
        navigateForward(const SettingScreen());
      },
      svgImage: 'assets/svg/settings.svg'),
  MoreScreenModel(
      title: LocaleKeys.shareMorshed.tr(),
      onTap: () {},
      svgImage: 'assets/svg/share.svg'),
];
