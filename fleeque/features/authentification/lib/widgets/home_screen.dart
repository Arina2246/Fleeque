import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  final VoidCallback callback;

  const HomeScreen({
    Key? key,
    required this.uid,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              callback();
            },
            child: Text('Log Out user $uid'),
          ),
        ],
      ),
    );
  }
}
