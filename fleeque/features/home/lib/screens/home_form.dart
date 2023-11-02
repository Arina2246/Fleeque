import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/bloc/home_bloc.dart';
import 'package:home/screens/widgets/home.dart';
import 'package:nav_bar/screens/nav_bar.dart';
import 'package:core_ui/widgets/influencers/error.dart';
import 'package:core_ui/widgets/influencers/loading.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeForm();
}

class _HomeForm extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: true,
        isDiscontShown: true,
        isWalletShown: true,
        isUserShown: true,
        isLogoShown: true,
        isInfoShown: true,
        isSettingsShown: false,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingInfluencersWidget();
          }
          if (state.isError) {
            return const ErrorInfluencersWidget();
          }
          return HomeWidget(influencersCollection: state.influencersCollection);
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
