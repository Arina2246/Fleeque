import 'package:authentification/forgot_password_page/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorForgotPasswordWidget extends StatelessWidget {
  const ErrorForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  _cleanErrorMessage(String text) {
    final index = text.indexOf(']');
    return text.substring(index + 1).trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        if (state is Error) {
          return Text(
            _cleanErrorMessage(
              state.message.toString(),
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
