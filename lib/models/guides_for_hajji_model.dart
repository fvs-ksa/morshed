class GuidesForHajjiModel{
  String image;
  String title;
  Function fct;
  GuidesForHajjiModel({required this.fct,required this.image,required this.title});
}
List<GuidesForHajjiModel>guidesForHajjiList=[
  GuidesForHajjiModel(fct: (){}, image: 'assets/images/hajj (1).png', title: 'خدمات الحرمين الشريفين'),
  GuidesForHajjiModel(fct: (){}, image: 'assets/images/umrah.png', title: 'معلومات الحج والعمره'),
  GuidesForHajjiModel(fct: (){}, image: 'assets/images/lost.png', title: 'دليل التوهان'),
  GuidesForHajjiModel(fct: (){}, image: 'assets/images/من نحن.png', title: 'عن مرشد'),
  GuidesForHajjiModel(fct: (){}, image: 'assets/images/guides.png', title: 'المزارات السياحيه'),
];