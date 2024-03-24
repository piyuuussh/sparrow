// import 'package:flutter/material.dart';
// import 'package:sparrow/core/constants/app_colors.dart';

// class AskUsScreen extends StatefulWidget {
//   const AskUsScreen({super.key});

//   @override
//   State<AskUsScreen> createState() => _AskUsScreenState();
// }

// class _AskUsScreenState extends State<AskUsScreen> {
//   _sendingMails() async {
//     var url = Uri.parse("mailto:piyushregular@gmail.com");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   TextEditingController textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     textEditingController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       appBar: AppBar(
//         backgroundColor: AppColor.background,
//         title: Text("Ask Us"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(27),
//           child: Column(children: [
//             TextFormField(
//               controller: textEditingController,
//               minLines: 8,
//               maxLines: 15,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 hintText: 'Ask Us',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 ),
//               ),
//             ),
//             Spacer(),
//             GestureDetector(
//               onTap: () async {
//                 String email = Uri.encodeComponent("singh007piyush@gmailcom");
//                 String subject = Uri.encodeComponent("Hello Flutter");
//                 String body = Uri.encodeComponent(textEditingController.text);
//                 print(subject); //output: Hello%20Flutter
//                 Uri mail =
//                     Uri.parse("mailto:$email?subject=$subject&body=$body");
//                 if (await launchUrl(mail)) {
//                   //email app opened
//                 } else {
//                   //email app is not opened
//                 }
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: AppColor.secondary,
//                 ),
//                 height: 50,
//                 width: 120,
//                 child: Text(
//                   "Share",
//                   style: TextStyle(fontSize: 25),
//                 ),
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
