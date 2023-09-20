import 'package:core_ui/core_ui.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageIconWidget extends StatelessWidget {
  final void Function({required XFile img}) uploadImg;
  final UserEntity userData;
  ImageIconWidget({Key? key, required this.userData, required this.uploadImg})
      : super(key: key);
  final ImagePicker _picker = ImagePicker();

  uploadImage(ImageSource media) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadImg(img: XFile(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userData.img == '' || userData.img == null) {
      return GestureDetector(
        child: Container(
          width: 135.0,
          height: 135.0,
          decoration: BoxDecoration(
            border: Border.all(color: black),
            shape: BoxShape.circle,
            color: white,
          ),
          child: Center(
            child: Text(
              'ADD PICTURE',
              style: GoogleFonts.roboto(
                decoration: TextDecoration.underline,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        onTap: () {
          uploadImage(ImageSource.gallery);
        },
      );
    } else {
      return GestureDetector(
        child: Container(
          width: 135.0,
          height: 135.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: NetworkImage(
                userData.img!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          uploadImage(ImageSource.gallery);
        },
      );
    }
  }
}
