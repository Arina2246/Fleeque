import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/home_screen.dart';
import 'package:login/screens/sign_in_screen.dart';
import 'package:login/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final String router;
  const LoginScreen({Key? key, required this.router}) : super(key: key);

  _body(String router) {
    return router == signInRoute ? const SignInScreen() : const SignUpScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          if (loginState is Authenticated) {
            return HomeScreen(
              uid: loginState.uid,
            );
          }
          if (loginState is Unauthenticated) {
            return _body(router);
          }

          if (loginState is SuccessLogin) {
            BlocProvider.of<LoginBloc>(context).loggedIn();
          }

          return _body(router);
        },
      ),
    );
  }
}
