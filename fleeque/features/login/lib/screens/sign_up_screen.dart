import 'package:core/core.dart';
import 'package:domain/entities/login/login_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/widgets/button_widget.dart';
import 'package:login/screens/widgets/change_screen_text_widget.dart';
import 'package:login/screens/widgets/error_login_widget.dart';
import 'package:login/screens/widgets/google_sign_in_button_widget.dart';
import 'package:login/screens/widgets/input_widget.dart';
import 'package:login/screens/widgets/text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void submitSignUp(BuildContext context) {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context).submitSignUp(
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
                  text: 'Register',
                )),
            const Spacer(),
            Expanded(
              flex: 1,
              child: InputWidget(
                obscureText: false,
                labelText: 'NAME',
                controller: _nameController,
              ),
            ),
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
              questionText: 'Already have an account ?',
              buttonText: 'Sign In!',
              callback: () => Navigator.pushNamed(context, loginRoute,
                  arguments: signInRoute),
            ),
            const Spacer(),
            const Spacer(),
            const GoogleSignInButtonWidget(),
            const Spacer(),
            ButtonWidget(
                text: 'REGISTER', callback: () => submitSignUp(context)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
