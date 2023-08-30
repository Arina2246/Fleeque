// import 'package:login/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login/pages/home_page.dart';
// import 'package:login/pages/login_register_page.dart';

// class WidgetTreePage extends StatefulWidget {
//   const WidgetTreePage({super.key});

//   @override
//   State<WidgetTreePage> createState() => _WidgetTreePage();
// }

// class _WidgetTreePage extends State<WidgetTreePage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return HomePage();
//         } else {
//           return const LoginRegisterPage();
//         }
//       },
//     );
//   }
// }
