import 'package:app_bar/screens/app_bar_widget.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets/input/text_input.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/screens/widgets/general_info.dart';

class SettingsScreen extends StatefulWidget {
  final void Function({required XFile img}) uploadImg;
  final void Function(
      {required String bankAccount,
      required String email,
      required String insta,
      required String name,
      required String number}) callback;
  final UserEntity userData;
  const SettingsScreen(
      {Key? key,
      required this.callback,
      required this.userData,
      required this.uploadImg})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();

  @override
  void initState() {
    if (widget.userData.name != null) {
      _nameController.text = widget.userData.name!;
    }
    if (widget.userData.email != null) {
      _emailController.text = widget.userData.email!;
    }
    if (widget.userData.number != null) {
      _numberController.text = widget.userData.number!;
    }
    if (widget.userData.insta != null) {
      _instaController.text = widget.userData.insta!;
    }
    if (widget.userData.bankAccount != null) {
      _bankAccountController.text = widget.userData.bankAccount!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _instaController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }

  void submitSavingData(context) async {
    widget.callback(
        name: _nameController.text,
        number: _numberController.text,
        bankAccount: _bankAccountController.text,
        email: _emailController.text,
        insta: _instaController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: false,
        isDiscontShown: false,
        isWalletShown: false,
        isUserShown: false,
        isLogoShown: false,
        isInfoShown: true,
        isSettingsShown: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              GeneralInfoWidget(
                userData: widget.userData,
                uploadImg: widget.uploadImg,
              ),
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextInputWidget(
                    obscureText: false,
                    labelText: 'YOUR NAME',
                    controller: _nameController),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextInputWidget(
                    obscureText: false,
                    labelText: 'YOUR EMAIL',
                    controller: _emailController),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextInputWidget(
                    obscureText: false,
                    labelText: 'YOUR NUMBER',
                    controller: _numberController),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextInputWidget(
                    obscureText: false,
                    labelText: 'YOUR INSTAGRAM NAME',
                    controller: _instaController),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextInputWidget(
                    obscureText: false,
                    labelText: 'YOUR BANK DETAILS',
                    controller: _bankAccountController),
              ),
              const Spacer(
                flex: 3,
              ),
              ElevatedButtonWidget(
                  width: (MediaQuery.of(context).size.width * 0.85).toInt(),
                  borderColor: black,
                  backgroundColor: black,
                  textColor: white,
                  text: 'SAVE',
                  onPressed: () {
                    submitSavingData(context);
                  }),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
