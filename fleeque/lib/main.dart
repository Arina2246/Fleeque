import 'package:core/core.dart';
import 'package:core/data_constants/authentification.dart';
import 'package:data/model/user/user_model.dart';
import 'package:fleeque/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:data/di/di.dart' as di;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(user);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleeque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: welcomeRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
