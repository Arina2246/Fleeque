import 'package:authentification/sign_in_page/bloc/sign_in_bloc.dart';
import 'package:authentification/sign_in_page/screens/widgets/forgot_password.dart';
import 'package:authentification/widgets/google_sign_in_button.dart';
import 'package:authentification/sign_in_page/screens/widgets/loading.dart';
import 'package:authentification/widgets/change_page.dart';
import 'package:authentification/widgets/home_screen.dart';
import 'package:authentification/widgets/intro_text.dart';
import 'package:authentification/widgets/submit_button.dart';
import 'package:authentification/widgets/text_input.dart';
import 'package:authentification/sign_in_page/screens/widgets/error.dart';
import 'package:core/core.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<SignInBloc>(context).add(
      Init(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submitSignIn() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<SignInBloc>(context).add(
        SubmitSignIn(
          UserEntity(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  void submitSignInGoogle() {
    BlocProvider.of<SignInBloc>(context).add(
      SubmitGoogleSignIn(),
    );
  }

  void logOut() {
    BlocProvider.of<SignInBloc>(context).add(
      LoggedOut(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return HomeScreen(
              callback: () => logOut(),
              uid: state.uid,
            );
          }
          if (state is Unauthenticated) {
            return _body();
          }

          if (state is Success) {
            BlocProvider.of<SignInBloc>(context).add(
              LoggedIn(),
            );
          }
          return _body();
        },
      ),
    );
  }

  Widget _body() {
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
              child: IntroTextWidget(
                text: 'Login with your credentials',
              ),
            ),
            const Spacer(),
            const LoadingWidget(),
            Expanded(
              flex: 1,
              child: TextInputWidget(
                obscureText: false,
                labelText: 'EMAIL',
                controller: _emailController,
              ),
            ),
            Expanded(
              flex: 1,
              child: TextInputWidget(
                obscureText: true,
                labelText: 'PASSWORD',
                controller: _passwordController,
              ),
            ),
            const ErrorSignInWidget(),
            ChangePageWidget(
              questionText: 'Don’t have an account ?',
              buttonText: 'Sign Up!',
              callback: () => Navigator.pushNamed(
                context,
                signUpRoute,
              ),
            ),
            const ForgotPasswordWidget(),
            const Spacer(),
            const Spacer(),
            GoogleSignInButtonWidget(
              callback: () => submitSignInGoogle(),
            ),
            const Spacer(),
            SubmitButtonWidget(
              text: 'LOGIN',
              callback: () => submitSignIn(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
