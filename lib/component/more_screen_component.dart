import 'package:flutter/cupertino.dart';

// Widget moreScreenComponent(){
//   return GestureDetector(
//     onTap: (){moreList[index].onTap;},
//     child: Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.sp)),
//       child: Container(
//         height: size.height * 0.07,
//         padding: EdgeInsetsDirectional.only(
//             start: size.width * 0.05,
//             top: size.height * 0.01,
//             bottom: size.height * 0.01),
//         decoration:
//         BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
//         child: Row(
//           children: [
//             SvgPicture.asset(moreList[index].svgImage),
//             SizedBox(
//               width: size.width * 0.03,
//             ),
//             Text(
//               moreList[index].title,
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }