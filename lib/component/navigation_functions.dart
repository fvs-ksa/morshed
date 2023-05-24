import 'package:easy_localization/easy_localization.dart';
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
  var whatsapp = "+966506977241";
  var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      ),
    );
  }
}

launchCall(context) async {
  var whatsapp = "+966506977241";
  var whatsappAndroid = Uri.parse("tel:$whatsapp");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      ),
    );
  }
}

navigateToMail(BuildContext context) async {
  Uri url = Uri.parse("mailto:info@guide.com");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(LocaleKeys.errorWhileMovingToEmail.tr()),
      ),
    );
  }
}
