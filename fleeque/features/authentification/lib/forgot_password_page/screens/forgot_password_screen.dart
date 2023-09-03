import 'package:authentification/forgot_password_page/bloc/forgot_password_bloc.dart';
import 'package:authentification/forgot_password_page/screens/forgot_password_form.dart';
import 'package:domain/usecases/authentification/forgot_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';

import 'package:data/di/authentification/di.dart' as di;

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc(
              forgotPasswordUsecase: di.sl<ForgotPasswordUsecase>(),
              errorAuthentificationUsecase:
                  di.sl<ErrorAuthentificationUsecase>(),
            ),
        child: const ForgotPasswordForm());
  }
}
