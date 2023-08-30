import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';

class ErrorLoginWidget extends StatelessWidget {
  const ErrorLoginWidget({
    Key? key,
  }) : super(key: key);

  _cleanErrorMessage(String text) {
    final index = text.indexOf(']');
    return text.substring(index + 1).trim();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (context, state) {
        return state is ErrorLogin;
      },
      builder: (context, state) {
        if (state is ErrorLogin) {
          return Text(_cleanErrorMessage(state.message.toString()));
        } else {
          return const Text('');
        }
      },
    );
  }
}
