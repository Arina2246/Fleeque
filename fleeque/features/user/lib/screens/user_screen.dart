import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:data/di/di.dart' as di;
import 'package:user/bloc/user_bloc.dart';
import 'package:user/screens/user_form.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        getUserDataUseCase: di.sl<GetUserDataUseCase>(),
      )..add(GetUserData()),
      child: const UserForm(),
    );
  }
}
