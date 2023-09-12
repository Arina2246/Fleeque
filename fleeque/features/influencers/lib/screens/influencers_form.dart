import 'dart:async';

import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:influencers/bloc/influencers_bloc.dart';
import 'package:influencers/screens/widgets/influencers.dart';
import 'package:nav_bar/screens/nav_bar.dart';
import 'package:core_ui/widgets/influencers/error.dart';
import 'package:core_ui/widgets/influencers/loading.dart';

class InfluencersForm extends StatefulWidget {
  const InfluencersForm({super.key});

  @override
  State<InfluencersForm> createState() => _InfluencersForm();
}

class _InfluencersForm extends State<InfluencersForm> {
  StreamController<Map<String, dynamic>> controller =
      StreamController<Map<String, dynamic>>();

  late Stream stream = controller.stream;

  @override
  initState() {
    super.initState();
    stream.listen((value) {
      BlocProvider.of<InfluencersBloc>(context).add(
        Filter(value),
      );
    });
  }

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
            controller: controller,
          );
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}