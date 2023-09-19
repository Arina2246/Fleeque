import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/bloc/user_bloc.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: black,
        textStyle: GoogleFonts.roboto(
          decoration: TextDecoration.underline,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        BlocProvider.of<UserBloc>(context).add(
          LogOut(),
        );
        Navigator.pushNamed(context, signInRoute);
      },
      child: const Text('Log out'),
    );
  }
}
