import 'package:core_ui/widgets/influencers/influencer_list/influencer_list.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:influencers/bloc/influencers_bloc.dart';
import 'package:influencers/screens/widgets/carousel_slider/carousel_slider.dart';
import 'package:influencers/screens/widgets/filter_button.dart';
import 'package:nav_bar/screens/nav_bar.dart';
import 'package:core_ui/widgets/influencers/error.dart';
import 'package:core_ui/widgets/influencers/loading.dart';

class InfluencersForm extends StatefulWidget {
  const InfluencersForm({super.key});

  @override
  State<InfluencersForm> createState() => _InfluencersForm();
}

class _InfluencersForm extends State<InfluencersForm> {
  @override
  void initState() {
    BlocProvider.of<InfluencersBloc>(context).add(
      Init(),
    );
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
      body: BlocBuilder<InfluencersBloc, InfluencersState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingInfluencersWidget();
          }
          if (state is Error) {
            return const ErrorInfluencersWidget();
          }

          if (state is Success) {
            return _body(influencersCollection: state.influencersCollection);
          }
          return const LoadingInfluencersWidget();
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
            width: MediaQuery.of(context).size.width * 0.85,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExtraBoldTextWidget(
                    text: 'Influencers',
                    color: black,
                    textAlign: TextAlign.left),
                FilternButtonWidget(),
              ],
            ),
          ),
          CarouselSliderWidget(
            influencersCollection: influencersCollection,
          ),
          InfluencerListWidget(
            influencersCollection: influencersCollection,
            itemsCount: 8,
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 5,
                  child: RegularTextWidget(
                    text: 'if you dont find influencer just let '
                        'us know and we will make sure they join Fleeque soon',
                    color: white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
        ],
      ),
    );
  }
}
