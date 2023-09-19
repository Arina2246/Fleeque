import 'package:domain/entities/user/user_entities.dart';
import 'package:flutter/material.dart';
import 'package:user/screens/widgets/image_icon.dart';
import 'package:user/screens/widgets/log_out_button.dart';
import 'package:user/screens/widgets/name_widget.dart';

class GeneralInfoWidget extends StatelessWidget {
  final UserEntity userData;
  const GeneralInfoWidget({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageIconWidget(),
        const LogOutButtonWidget(),
        NameWidget(
          userData: userData,
        ),
      ],
    );
  }
}
