import 'package:authentification/sign_up_page/bloc/sign_up_bloc.dart';
import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is Loading) {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(black),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
