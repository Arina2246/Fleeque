import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data/di/di.dart' as di;
import 'package:influencers/bloc/influencers_bloc.dart';
import 'package:influencers/screens/influencers_form.dart';

class InfluencersScreen extends StatelessWidget {
  const InfluencersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencersBloc(
        getInfluencersCollectionUsecase:
            di.sl<GetInfluencersCollectionUsecase>(),
      )..add(Init()),
      child: const InfluencersForm(),
    );
  }
}
