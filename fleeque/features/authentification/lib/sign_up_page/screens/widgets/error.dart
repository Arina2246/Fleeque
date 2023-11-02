import 'package:authentification/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorSignUpWidget extends StatelessWidget {
  const ErrorSignUpWidget({
    Key? key,
  }) : super(key: key);

  _cleanErrorMessage(String text) {
    final index = text.indexOf(']');
    return text.substring(index + 1).trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state.isError) {
          return Text(
            _cleanErrorMessage(
              state.errorMessage.toString(),
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
