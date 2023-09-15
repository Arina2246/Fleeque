import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:influencers/bloc/influencers_bloc.dart';
import 'package:influencers/screens/widgets/influencers.dart';
import 'package:nav_bar/screens/nav_bar.dart';
import 'package:core_ui/widgets/influencers/error.dart';
import 'package:core_ui/widgets/influencers/loading.dart';

class InfluencersForm extends StatelessWidget {
  const InfluencersForm({super.key});

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
      ),
      body: BlocBuilder<InfluencersBloc, InfluencersState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingInfluencersWidget();
          }
          if (state.isError) {
            return const ErrorInfluencersWidget();
          }
          return InfluencersWidget(
            influencersCollection: state.influencersCollection,
          );
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
