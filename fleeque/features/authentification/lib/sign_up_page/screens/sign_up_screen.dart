import 'package:authentification/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:authentification/sign_up_page/screens/sign_up_form.dart';
import 'package:domain/usecases/authentification/sign_in_with_google_usecase.dart';
import 'package:domain/usecases/authentification/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';
import 'package:domain/usecases/authentification/get_current_uid_usecase.dart';
import 'package:domain/usecases/authentification/is_sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_out_usecase.dart';

import 'package:data/di/di.dart' as di;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        errorAuthentificationUsecase: di.sl<ErrorAuthentificationUsecase>(),
        getCurrentUidUseCase: di.sl<GetCurrentUidUseCase>(),
        isSignInUseCase: di.sl<IsSignInUseCase>(),
        signOutUseCase: di.sl<SignOutUseCase>(),
        signUpUseCase: di.sl<SignUpUseCase>(),
        signInWithGoogleUsecase: di.sl<SignInWithGoogleUsecase>(),
      ),
      child: const SignUpForm(),
    );
  }
}
