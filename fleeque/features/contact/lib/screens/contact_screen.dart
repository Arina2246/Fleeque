import 'package:app_bar/app_bar.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:nav_bar/screens/nav_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: true,
        isDiscontShown: true,
        isWalletShown: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: const [Text('SPANCH BOB')],
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
