import 'package:authentification/sign_in_page/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorSignInWidget extends StatelessWidget {
  const ErrorSignInWidget({
    Key? key,
  }) : super(key: key);

  _cleanErrorMessage(String text) {
    final index = text.indexOf(']');
    return text.substring(index + 1).trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state.isError) {
          return Text(
            _cleanErrorMessage(
              state.errorMessage,
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
