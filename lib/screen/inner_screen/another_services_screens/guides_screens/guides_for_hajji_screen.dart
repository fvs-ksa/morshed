import 'package:flutter/material.dart';
import 'package:morshed/component/info_profile_component.dart';
import 'package:morshed/models/guides_for_hajji_model.dart';
import '../../../../component/const_color.dart';

class GuidesForHajjiScreen extends StatelessWidget {
  const GuidesForHajjiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(child: Image.asset('assets/images/header1.png',fit: BoxFit.cover,)),
                FlexibleSpaceBar.createSettings(currentExtent: 10, child:  Padding(
                  padding:EdgeInsetsDirectional.only(top: screenSize.height*0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: backButtonWidget(fct: () {
                          Navigator.pop(context);
                        }),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.only(start: screenSize.width*0.03),
                        child: Text('إرشادات',style:  Theme.of(context).textTheme.headline2,),
                      )
                    ],
                  ),
                ),),
                Padding(
                  padding:  EdgeInsetsDirectional.only(top: screenSize.height*0.02),
                  child: FlexibleSpaceBar(
                    title: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Image.asset(
                          'assets/images/whiteMorshed.png',
                        height: screenSize.height * 0.07,
                                    width: screenSize.width * 0.4,
                                    fit: BoxFit.contain,
                       // style: Theme.of(context).textTheme.headline2,

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
          preferredSize: Size.fromHeight(screenSize.height * 0.15)),
      // appBar: PreferredSize(child: Stack(
      //
      //   fit: StackFit.loose,
      //   children: [
      //   Container(
      //     //height:screenSize.height*0.20 ,
      //     child: Image.asset('assets/images/header1.png'),
      //   ),
      //   Padding(
      //     padding: EdgeInsetsDirectional.only(start: screenSize.width*0.02,top: screenSize.height*0.02),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           //crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //           backButtonWidget(fct: (){Navigator.pop(context);}),
      //           Image.asset('assets/images/whiteMorshed.png',height: screenSize.height * 0.07,
      //             width: screenSize.width * 0.4,
      //             fit: BoxFit.contain,)
      //         ],),
      //         Text('إرشادات',style:  Theme.of(context).textTheme.headline2,)
      //       ],
      //     ),
      //   )
      // ],), preferredSize: Size.fromHeight(screenSize.height*0.15,)),
      backgroundColor: whiteGreyColor,
      body: Padding(
        padding:  EdgeInsets.only(bottom: screenSize.height*0.02),
        child: ListView.builder(
            itemCount: guidesForHajjiList.length,
            itemBuilder: (context,index){
             return GestureDetector(
                onTap: ()=>guidesForHajjiList[index].fct(),
                child: Container(
                  height: screenSize.height*0.13,
                  margin: EdgeInsetsDirectional.only(start: screenSize.width*0.03,end:screenSize.width*0.03 ,top: screenSize.height*0.03),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: ListTile(
                      title: Text(guidesForHajjiList[index].title,style: Theme.of(context).textTheme.bodyText2,),
                      leading: Image.asset(guidesForHajjiList[index].image),),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
