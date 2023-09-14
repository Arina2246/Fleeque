import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/bloc/home_bloc.dart';
import 'package:data/di/di.dart' as di;
import 'package:home/screens/home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getInfluencersCollectionUsecase:
            di.sl<GetInfluencersCollectionUsecase>(),
      )..add(Init()),
      child: const HomeForm(),
    );
  }
}
