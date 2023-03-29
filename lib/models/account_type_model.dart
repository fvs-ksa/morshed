class AccountTypeModel{
  int id;
  bool isTabbed;
  String name;
  String image;
  AccountTypeModel({required this.image,required this.id,required this.name,required this.isTabbed});

}
List<AccountTypeModel> typeModel=[
  AccountTypeModel(image: 'assets/images/umrah.png', id: 0, name: 'معتمر', isTabbed: false),
  AccountTypeModel(image: 'assets/images/hajj.png', id: 1, name: 'حاج', isTabbed: false),
];