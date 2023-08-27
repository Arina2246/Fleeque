import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  final bool isOnline;
  const UserIconWidget({
    Key? key,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/user_icon.png'))),
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    if (isOnline)
                      SizedBox(
                        child: Image.asset(
                            'assets/images/app_bar/online_marker_icon.png'),
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
