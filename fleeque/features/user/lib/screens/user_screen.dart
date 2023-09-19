import 'package:domain/usecases/authentification/sign_out_usecase.dart';
import 'package:domain/usecases/user/delete_user_uid_usecase.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:domain/usecases/user/get_user_uid_usecase.dart';
import 'package:domain/usecases/user/update_user_data_usecase.dart';
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
        getUserUidUseCase: di.sl<GetUserUidUseCase>(),
        deleteUserUidUseCase: di.sl<DeleteUserUidUseCase>(),
        getUserDataUseCase: di.sl<GetUserDataUseCase>(),
        updateUserDataUseCase: di.sl<UpdateUserDataUseCase>(),
        signOutUseCase: di.sl<SignOutUseCase>(),
      )..add(GetUserData()),
      child: const UserForm(),
    );
  }
}
