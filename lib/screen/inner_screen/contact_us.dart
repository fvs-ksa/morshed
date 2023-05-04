import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morshed/component/component.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/translation/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/const_color.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: Stack(
            //  alignment: AlignmentDirectional.topStart,
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/contact_header.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: screenSize.width * 0.07,
                    top: screenSize.height * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backButtonWidget(fct: () {
                      Navigator.pop(context);
                    }),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    Text(
                      LocaleKeys.contactUs.tr(),
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              )
            ],
          ),
          preferredSize: Size.fromHeight(screenSize.height * 0.22)),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenSize.height * 0.04,
              start: screenSize.width * 0.04,
              end: screenSize.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.contactViaWhatsApp.tr(),
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              GestureDetector(
                  onTap: () {
                    navigateToCallUs(context);
                  },
                  child: textFormField(
                    labelText: '9665078945612+',
                   // hintText: 'hintText',
                    context: context,
                    isEnabled: false,
                  )),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Text(
                LocaleKeys.contactViaEmail.tr(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              GestureDetector(
                  onTap: () {
                    navigateToMail(context);
                  },
                  child: textFormField(
                      labelText: 'info@guide.com',
                      //hintText: 'hintText',
                      context: context,
                      isEnabled: false)),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Text(
                LocaleKeys.weArePleasedToAnswerYourInquiry.tr(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              bigTextFieldForNotes(
                  context: context, hint:LocaleKeys.writeHere.tr()),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenSize.height * 0.04,
                    bottom: screenSize.height * 0.02,
                    start: screenSize.width * 0.03,
                    end: screenSize.width * 0.03),
                child: Align(
                    alignment: Alignment.center,
                    child: mainButton(
                        width: screenSize.width * 0.8,
                        height: screenSize.height * 0.07,
                        text:LocaleKeys.sendInquiry.tr(),
                        color: darkMainColor,
                        context: context,
                        fct: () {})),
              )
            ],
          ),
        ),
      ),
    );
  }
}

navigateToCallUs(BuildContext context) async {
  var url = Uri.parse("tel:966506912345");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        backgroundColor: Colors.red,
        content: Text(LocaleKeys.errorWhileMovingToWhatsApp.tr()),
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
