import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleeque/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/bloc/login_bloc.dart';

import './injection_container.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getIt.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => getIt.getIt<LoginBloc>()..appStarted()),
      ],
      child: MaterialApp(
        title: 'Fleeque',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        initialRoute: welcomeRoute,
        onGenerateRoute: generateRoute,
      ),
    );

    // return MaterialApp(
    //   title: 'Fleeque',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(useMaterial3: true),
    //   initialRoute: welcomeRoute,
    //   onGenerateRoute: generateRoute,
    // );
  }
}
