import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/home_page.dart';
import 'package:login/screens/sign_in_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        if (loginState is Authenticated) {
          return HomePage(
            uid: loginState.uid,
          );
        }
        if (loginState is Unauthenticated) {
          return const SignInPage();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
