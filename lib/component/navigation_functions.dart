import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utiels/navigation_Services.dart';

navigateForward(Widget page, {arguments}) {
  NavigationService.navigate().navigateToScreen(page, arguments: arguments);
}

navigateForwardReplace(Widget page, {arguments}) {
  NavigationService.navigate().replaceScreen(page, arguments: arguments);
}

navigateForwardPop(Widget page, {arguments}) {
  NavigationService.navigate().goBack(page);
}
launchWhatsapp(context) async {
  var whatsapp = "966506977241";
  final Uri url=Uri.parse('https://wa.me/966506977241?text=Hello%20World!');
  // var whatsappAndroid =
  // Uri.parse("https://api.whatsapp.com/send?phone=966506977241");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(LocaleKeys.errorWhileMovingToWhatsApp.tr()),
      ),
    );
  }
}
