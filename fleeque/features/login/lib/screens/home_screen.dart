import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/screens/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  final String uid;

  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoadingWidget(),
        TextButton(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).loggedOut();
          },
          child: Text('Log Out user$uid'),
        ),
      ],
    ));
  }
}
