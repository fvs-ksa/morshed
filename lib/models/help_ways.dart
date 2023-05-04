import 'package:easy_localization/easy_localization.dart';

import '../translation/locale_keys.g.dart';

class HelpWay{
  String title;
  bool value;
  HelpWay({required this.value,required this.title});
}
List<HelpWay>helpWays=[
  HelpWay(value: false, title:LocaleKeys.iWouldLikeHelpWithReachingTheHotel.tr()),
  HelpWay(value: false, title:LocaleKeys.communicatingThroughVideoCall.tr()),
  HelpWay(value: false, title:LocaleKeys.iWouldLikeHelpWithReachingTheCamp.tr()),
  HelpWay(value: false, title: LocaleKeys.INeedHelpToJoinTheGroup.tr()),
];