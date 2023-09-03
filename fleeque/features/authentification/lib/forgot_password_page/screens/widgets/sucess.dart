import 'package:authentification/forgot_password_page/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SucessForgotPasswordWidget extends StatelessWidget {
  const SucessForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (context, state) {
        return state is Success;
      },
      builder: (context, state) {
        if (state is Success) {
          return const Text('Mail send to your Email');
        } else {
          return const Text('');
        }
      },
    );
  }
}
