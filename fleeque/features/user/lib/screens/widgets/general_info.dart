import 'package:domain/entities/user/user_entities.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/screens/widgets/image_icon.dart';
import 'package:user/screens/widgets/log_out_button.dart';
import 'package:user/screens/widgets/name_widget.dart';

class GeneralInfoWidget extends StatelessWidget {
  final void Function({required XFile img}) uploadImg;
  final UserEntity userData;
  const GeneralInfoWidget(
      {Key? key, required this.userData, required this.uploadImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageIconWidget(
          userData: userData,
          uploadImg: uploadImg,
        ),
        const LogOutButtonWidget(),
        NameWidget(
          userData: userData,
        ),
      ],
    );
  }
}
