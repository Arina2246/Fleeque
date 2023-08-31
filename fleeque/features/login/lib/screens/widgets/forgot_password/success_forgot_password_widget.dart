import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';

class SucessForgotPasswordWidget extends StatelessWidget {
  const SucessForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (context, state) {
        return state is SuccessForgotPassword;
      },
      builder: (context, state) {
        if (state is SuccessForgotPassword) {
          return const Text('Mail send to your Email');
        } else {
          return const Text('');
        }
      },
    );
  }
}
