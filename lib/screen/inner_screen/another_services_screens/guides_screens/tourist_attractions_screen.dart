import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../component/guide_for_hajj_widget.dart';

class TouristAttractionsScreen extends StatelessWidget {
  const TouristAttractionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: headerForHijGuides(image: 'assets/images/guides.png',context: context,title: 'المزارات السياحيه'),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.03),
        child: Column(
          children: [
            Row(children: [
              SvgPicture.asset('assets/svg/Path 198320.svg'),
              SizedBox(width: screenSize.width*0.03,),
              Text('مزارات مكه المكرمه')
            ],),
            Text('لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق "ليتراسيت" (Letraset) البلاستيكية تحوي مقاطع'
                ' من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل "ألدوس بايج مايكر" '
                '(Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.',style: Theme.of(context).textTheme.caption,),
            Row(children: [
              SvgPicture.asset('assets/svg/Path 198320.svg'),
              SizedBox(width: screenSize.width*0.03,),
              Text('مزارات المدينه المنوره')
            ],),
            Text('لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق "ليتراسيت" (Letraset) البلاستيكية تحوي مقاطع'
                ' من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل "ألدوس بايج مايكر" '
                '(Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.',style: Theme.of(context).textTheme.caption,)
          ],
        ),
      ),
    );
  }
}