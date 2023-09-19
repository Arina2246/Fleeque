import 'package:authentification/forgot_password_page/bloc/forgot_password_bloc.dart';
import 'package:authentification/forgot_password_page/screens/widgets/error.dart';
import 'package:authentification/forgot_password_page/screens/widgets/loading.dart';
import 'package:authentification/forgot_password_page/screens/widgets/sucess.dart';
import 'package:authentification/widgets/change_page.dart';
import 'package:authentification/widgets/intro_text.dart';
import 'package:authentification/widgets/submit_button.dart';
import 'package:core_ui/widgets/input/text_input.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void submitForgotPassword(BuildContext context) {
    if (_emailController.text.isNotEmpty) {
      BlocProvider.of<ForgotPasswordBloc>(context).add(
        SubmitForgotPassword(_emailController.text),
      );
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
              flex: 2,
              child: IntroTextWidget(
                text: 'Enter the email address associated with your account'
                    ' and we`ll send you a link to reset your email',
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
            const ErrorForgotPasswordWidget(),
            const SucessForgotPasswordWidget(),
            ChangePageWidget(
              questionText: '',
              buttonText: 'Return to previous page',
              callback: () => Navigator.pushNamed(
                context,
                signInRoute,
              ),
            ),
            const Spacer(),
            SubmitButtonWidget(
              text: 'SEND MAIL',
              callback: () => submitForgotPassword(context),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
