import 'package:easy_localization/easy_localization.dart';
import 'package:morshed/translation/locale_keys.g.dart';

class BoardingModel{
  String image;
  String title;
  String subTitle;
  BoardingModel({required this.image,required this.title,required this.subTitle});

}
List<BoardingModel> boardingList=[
  BoardingModel(image: 'assets/images/i1.png', title: 'شخص تائه؟', subTitle: 'قم بالتبليغ عن الشخص التائه بسهولة'),
  BoardingModel(image: 'assets/images/i2.png', title:'تريد إرشاد؟' , subTitle:'أحصل على جميع الإرشادات الخاصة بك' ),
];
//LocaleKeys.boardingTitle1.tr()
//LocaleKeys.boardingTitle2.tr()
//LocaleKeys.boardingSubTitle1.tr()
//LocaleKeys.boardingSubTitle2.tr()