// import 'package:flutter/material.dart';
// buildAddCategory(){
//   return Container(
//     height: 250,
//     padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[200]),
//     child: Form(
//       key: formKey,
//       child: Column(
//         children: [
//           buildTextField(
//             controller: textProvider.textEditingController1,
//             text: 'اضف صنف للمنتجات',
//             icon: Icons.category,
//           ),
//           Wrap(
//             spacing: 12,
//             runSpacing: 12,
//             alignment: WrapAlignment.center,
//             children: [
//               // if (images.length <= 3)
//               InkWell(
//                 onTap: () {
//                   //  pickImage();
//                 },
//                 child: Container(
//                   height: 80,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: Colors.blue,width: 2)),
//                   child: Icon(
//                     Icons.add_a_photo_outlined,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               // ...images.map(
//               //       (e) => Container(
//               //     height: 100,
//               //     width: 50,
//               //     decoration: BoxDecoration(
//               //         border: Border.all(
//               //             color: Color(0xFF48907E))),
//               //     child: Image.file(
//               //       e,
//               //       fit: BoxFit.cover,
//               //     ),
//               //   ),
//
//             ],
//           ),
//         ],
//       ),
//     ),
//   )
// }
