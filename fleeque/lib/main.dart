import 'package:core/core.dart';
import 'package:fleeque/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
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
      initialRoute: welcomeRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
//доделать splash screen

//app bar переместить в core ui



// вот смотри
// мы же папки core и core ui должны хранить в корне приложения
// но мы не можем импортировать что-то вне папки lib если это не package
// и ты хранишь там цыета и так далее в общем пакадже кор или в папке кор у тебя несколько package для каждого разветвления
