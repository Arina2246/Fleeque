// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login/auth.dart';
// import 'package:flutter/material.dart';

// class LoginRegisterPage extends StatefulWidget {
//   const LoginRegisterPage({super.key});

//   @override
//   State<LoginRegisterPage> createState() => _LoginRegisterPage();
// }

// class _LoginRegisterPage extends State<LoginRegisterPage> {
//   String? errorMessage = '';
//   bool isLogin = true;
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(
//         () {
//           errorMessage = e.message;
//         },
//       );
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(
//         () {
//           errorMessage = e.message;
//         },
//       );
//     }
//   }

//   Widget _title() {
//     return const Text('LOGIIIIN');
//   }

//   Widget _entryField(String title, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(labelText: title),
//     );
//   }

//   Widget _errorMessage() {
//     return Text(errorMessage == '' ? '' : 'oops $errorMessage');
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//       onPressed:
//           isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
//       child: Text(isLogin ? 'login' : 'register'),
//     );
//   }

//   Widget _loginOrRegisterButton() {
//     return TextButton(
//       onPressed: () {
//         setState(
//           () {
//             isLogin = !isLogin;
//           },
//         );
//       },
//       child: Text(isLogin ? 'register instead' : 'login instead'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _title(),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _entryField('email', _controllerEmail),
//           _entryField('password', _controllerPassword),
//           _errorMessage(),
//           _submitButton(),
//           _loginOrRegisterButton(),
//         ],
//       ),
//     );
//   }
// }
