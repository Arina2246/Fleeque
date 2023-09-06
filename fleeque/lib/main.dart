import 'package:core/core.dart';
import 'package:fleeque/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:data/di/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleeque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      // initialRoute: welcomeRoute,
      initialRoute: homeRoute,
      onGenerateRoute: generateRoute,
    );
  }
}



//сделать about страницу
// сделать страницу инфлюенсеров

