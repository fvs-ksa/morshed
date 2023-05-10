import 'package:flutter/material.dart';
import 'info_profile_component.dart';

headerAnotherServices(
    {required BuildContext context,
    bool isProfile = false,
    required String title,
    bool isHeaderProfile = true}) {
  Size screenSize = MediaQuery.of(context).size;
  return PreferredSize(
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(child: Image.asset('assets/images/header1.png',fit: BoxFit.cover,)),
            FlexibleSpaceBar.createSettings(currentExtent: 10, child:  Align(
              alignment: Alignment.centerRight,
              child: backButtonWidget(fct: () {
                Navigator.pop(context);
              }),
            ),),
            Padding(
              padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.02),
              child: FlexibleSpaceBar(

                title: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(screenSize.height * 0.15));
}
