import 'package:authentification/sign_up_page/screens/widgets/loading.dart';
import 'package:authentification/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:authentification/sign_up_page/screens/widgets/error.dart';
import 'package:authentification/widgets/change_page.dart';
import 'package:authentification/widgets/google_sign_in_button.dart';
import 'package:authentification/widgets/intro_text.dart';
import 'package:authentification/widgets/submit_button.dart';
import 'package:core_ui/widgets/input/text_input.dart';
import 'package:core/core.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submitSignUp() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      BlocProvider.of<SignUpBloc>(context).add(
        SubmitSignUp(
          AuthentificationEntity(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  void submitSignUpGoogle() {
    BlocProvider.of<SignUpBloc>(context).add(
      SubmitSignUpGoogle(),
    );
  }

  void logOut() {
    BlocProvider.of<SignUpBloc>(context).add(
      LoggedOut(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (BuildContext context, SignUpState state) {
          if (state.isAuthenticated) {
            Navigator.pushNamed(context, homeRoute);
          }
        },
        builder: (context, state) {
          return SizedBox(
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
                    text: 'Register with your credentials',
                  ),
                ),
                const LoadingWidget(),
                const Spacer(),
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
                const ErrorSignUpWidget(),
                ChangePageWidget(
                  questionText: 'Already have an account ?',
                  buttonText: 'Sign In!',
                  callback: () => Navigator.pushNamed(
                    context,
                    signInRoute,
                  ),
                ),
                const Spacer(),
                const Spacer(),
                GoogleSignInButtonWidget(
                  callback: () => submitSignUpGoogle(),
                ),
                const Spacer(),
                SubmitButtonWidget(
                  text: 'REGISTER',
                  callback: () => submitSignUp(),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
