// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:sran/core/utils/math_utils.dart';
// import 'package:sran/core/widgets/platform_widgets/platform_widget.dart';
//
//
// class PlatformBottomSheet extends PlatformWidget {
//   PlatformBottomSheet(
//       {Key? key,
//       required this.onChanged,
//       required this.items,})
//       : super(key: key);
//
//   String initialItem;
//   Function(String?)? onChanged;
//   List<Widget> items;
//
//   @override
//   Widget buildCupertinoWidget(BuildContext context) {
//     // TODO: implement buildCupertinoWidget
//     throw UnimplementedError();
//     }
//
//   @override
//   Widget buildMaterialWidget(BuildContext context) {
//     // TODO: implement buildMaterialWidget
//     Get.bottomSheet(
//         Container(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: items,
//             ),
//           ),
//         ),
//         elevation: 20.0,
//         enableDrag: false,
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30.0),
//               topRight: Radius.circular(30.0),
//             )
//         )
//
//     );
//
//   }
//
//
//   // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
//
// }
