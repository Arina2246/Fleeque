import 'package:core/core.dart';
import 'package:domain/entities/login/login_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/widgets/button_widget.dart';
import 'package:login/screens/widgets/change_screen_text_widget.dart';
import 'package:login/screens/widgets/error_login_widget.dart';
import 'package:login/screens/widgets/forgot_password/forgot_password_widget.dart';
import 'package:login/screens/widgets/google_sign_in_button_widget.dart';
import 'package:login/screens/widgets/input_widget.dart';
import 'package:login/screens/widgets/loading_widget.dart';
import 'package:login/screens/widgets/text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submitSignIn(BuildContext context) {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).submitSignIn(
          user: UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Expanded(
                flex: 6,
                child: TextWidget(
                  text: 'Login',
                )),
            const Spacer(),
            const LoadingWidget(),
            Expanded(
              flex: 1,
              child: InputWidget(
                obscureText: false,
                labelText: 'EMAIL',
                controller: _emailController,
              ),
            ),
            Expanded(
              flex: 1,
              child: InputWidget(
                obscureText: true,
                labelText: 'PASSWORD',
                controller: _passwordController,
              ),
            ),
            const ErrorLoginWidget(),
            ChangeScreenTextWidget(
                questionText: 'Don’t have an account ?',
                buttonText: 'Sign Up!',
                callback: () => Navigator.pushNamed(
                    context, authenticationRoute,
                    arguments: signUpRoute)),
            const ForgotPasswordWidget(),
            const Spacer(),
            const Spacer(),
            const GoogleSignInButtonWidget(),
            const Spacer(),
            ButtonWidget(text: 'LOGIN', callback: () => submitSignIn(context)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
