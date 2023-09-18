import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/bloc/user_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserForm();
}

class _UserForm extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isLoading) {
            print('KKMK');
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const SizedBox(
                height: 60, width: 100, child: Text('loading...'));
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => {
                              BlocProvider.of<UserBloc>(context).add(
                                UpdateName(),
                              ),
                            },
                        child: Text('change name')),
                    ElevatedButton(
                        onPressed: () => {
                              BlocProvider.of<UserBloc>(context).add(
                                ShowName(),
                              ),
                            },
                        child: Text('show name')),
                  ],
                ),
                // SizedBox(
                //     // height: 50,
                //     width: 300,
                //     child: Text('user uid: ${state.userData!.uid}')),
              ],
            );
          }
        },
      ),
    );
  }
}
