import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/widgets/button_widget.dart';
import 'package:login/screens/widgets/change_screen_text_widget.dart';
import 'package:login/screens/widgets/error_login_widget.dart';
import 'package:login/screens/widgets/input_widget.dart';
import 'package:login/screens/widgets/loading_widget.dart';
import 'package:login/screens/widgets/forgot_password/success_forgot_password_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void submitForgotPassword(BuildContext context) {
    if (_emailController.text.isNotEmpty) {
      BlocProvider.of<LoginBloc>(context)
          .submitForgotPassword(email: _emailController.text);
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
            Expanded(
              flex: 2,
              child: Text(
                'Enter the email address associated with your account'
                ' and we`ll send you a link to reset your email',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const LoadingWidget(),
            const Spacer(),
            Expanded(
              flex: 1,
              child: InputWidget(
                obscureText: false,
                labelText: 'EMAIL',
                controller: _emailController,
              ),
            ),
            const ErrorLoginWidget(),
            const SucessForgotPasswordWidget(),
            ChangeScreenTextWidget(
                questionText: '',
                buttonText: 'Return to previous page',
                callback: () => Navigator.pushNamed(context, loginRoute,
                    arguments: signInRoute)),
            const Spacer(),
            ButtonWidget(
                text: 'SEND MAIL',
                callback: () => submitForgotPassword(context)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
