import 'package:core/core.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/bloc/home_bloc.dart';
import 'package:home/screens/widgets/bold_text.dart';
import 'package:home/screens/widgets/carousel_slider/carousel_slider.dart';
import 'package:home/screens/widgets/error.dart';
import 'package:home/screens/widgets/influencer_list/influencer_list.dart';
import 'package:home/screens/widgets/loading.dart';
import 'package:home/screens/widgets/popular_button.dart';
import 'package:nav_bar/screens/nav_bar.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeForm();
}

class _HomeForm extends State<HomeForm> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: true,
        isDiscontShown: true,
        isWalletShown: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingHomeWidget();
          }
          if (state is Error) {
            return const ErrorHomeWidget();
          }

          if (state is Success) {
            return _body(influencersCollection: state.influencersCollection);
          }
          return const LoadingHomeWidget();
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }

  Widget _body({required List<InfluencerEntity> influencersCollection}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width * 0.85, // set this
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopularButtonWidget(),
                BoldTextWidget(text: 'Swipe to explore Influencers'),
              ],
            ),
          ),
          CarouselSliderWidget(
            influencersCollection: influencersCollection,
          ),
          InfluencerListWidget(
            influencersCollection: influencersCollection,
          ),
          ElevatedButtonWidget(
            width: (MediaQuery.of(context).size.width * 0.85).toInt(),
            borderColor: black,
            backgroundColor: black,
            textColor: white,
            text: 'SEE MORE',
            onPressed: () => {Navigator.pushNamed(context, influencersRoute)},
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      ),
    );
  }
}
