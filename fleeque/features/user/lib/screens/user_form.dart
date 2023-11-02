import 'package:app_bar/app_bar.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/bloc/user_bloc.dart';
import 'package:user/screens/settings_screen.dart';
import 'package:user/screens/widgets/general_info.dart';
import 'package:user/screens/widgets/text_button_widget.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserForm();
}

class _UserForm extends State<UserForm> {
  void submitUpdateUserData(
      {required String number,
      required String bankAccount,
      required String email,
      required String insta,
      required String name}) {
    BlocProvider.of<UserBloc>(context).add(
      UpdateUserData(
          number: number,
          bankAccount: bankAccount,
          email: email,
          insta: insta,
          name: name),
    );
  }

  void submitUpdateUserImg({required XFile img}) {
    BlocProvider.of<UserBloc>(context).add(
      UpdateUserImg(
        img: img,
      ),
    );
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(black),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    GeneralInfoWidget(
                      userData: state.userData!,
                      uploadImg: submitUpdateUserImg,
                    ),
                    const Spacer(),
                    TextButtonWidget(
                      callback: () => {},
                      text: 'Donate',
                    ),
                    TextButtonWidget(
                      callback: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(
                              uploadImg: submitUpdateUserImg,
                              callback: submitUpdateUserData,
                              userData: state.userData!,
                            ),
                          ),
                        ),
                      },
                      text: 'Settings',
                    ),
                    TextButtonWidget(
                      callback: () => {},
                      text: 'Orders',
                    ),
                    TextButtonWidget(
                      callback: () => {},
                      text: 'Create Offer',
                    ),
                    TextButtonWidget(
                      callback: () => {},
                      text: 'Contact',
                    ),
                    TextButtonWidget(
                      callback: () => {},
                      text: 'Support',
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
