import 'package:flutter/material.dart';

import 'const_color.dart';
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
         // fit: StackFit.expand,
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
                    style: Theme.of(context).textTheme.headline2,

                    //textAlign: TextAlign.center,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ],
        ),

      //   backgroundColor: Colors.transparent,
      // foregroundColor: Colors.transparent,
      // centerTitle: true,
      //   leading: Align(
      //     alignment: Alignment.center,
      //     child: backButtonWidget(fct: () {
      //       Navigator.pop(context);
      //     }),
      //   ),
        // title: Text(
        //   title,
        //   style: Theme.of(context).textTheme.headline2,
        // ),
      ),
      preferredSize: Size.fromHeight(screenSize.height * 0.15));
  // decoration: const BoxDecoration(
  //     image: DecorationImage(
  //         image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
  // return PreferredSize(
  //     child: Stack(
  //       children: [
  //         Container(
  //           height: screenSize.height * 0.2,
  //           child: Padding(
  //             padding:  EdgeInsetsDirectional.only(end: !isProfile?screenSize.width*0.04:0,bottom:!isProfile?screenSize.height*0.02:0 ),
  //             child: Align(alignment: isProfile?AlignmentDirectional.center:AlignmentDirectional.bottomEnd,child: Text(title,style: Theme.of(context).textTheme.headline2,)),
  //           ),
  //           decoration: const BoxDecoration(
  //               image: DecorationImage(
  //                   image: AssetImage('assets/images/header1.png'),fit: BoxFit.cover)),
  //         ),
  //         Padding(
  //           padding:  EdgeInsetsDirectional.only(top: screenSize.width*0.03),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               backButtonWidget(fct: (){Navigator.pop(context);}),
  //               SizedBox(height: screenSize.height*0.03,),
  //               isHeaderProfile?  Padding(
  //                 padding:  EdgeInsetsDirectional.only(start: screenSize.width*0.03,),
  //                 child: CircleAvatar(backgroundColor: darkMainColor,child: Image.asset('assets/images/profile.png'),
  //                   radius: screenSize.height*0.05,
  //                 ),
  //               ):SizedBox()
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //     preferredSize: Size.fromHeight(screenSize.height * 0.25));
}
