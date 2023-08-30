// import 'package:core_ui/core_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Text(
//             'Login with your credentials',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.montserrat(
//               color: black,
//               fontSize: 24,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//           SizedBox(
//             width: 356.0,
//             height: 28,
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 labelStyle: TextStyle(color: black, fontSize: 12.0),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: black),
//                 ),
//                 labelText: 'EMAIL',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           SizedBox(
//             width: 356.0,
//             height: 28,
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 labelStyle: TextStyle(color: black, fontSize: 12.0),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: black),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: black),
//                 ),
//                 labelText: 'PASSWORD',
//               ),
//               obscureText: true,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => {},
//             child: Text('Don’t have an account ? Sign Up!'),
//           ),
//         ]),
//       ),
//     );
//   }
// }
