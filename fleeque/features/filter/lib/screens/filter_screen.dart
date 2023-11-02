import 'package:domain/usecases/influencers/filter_usecase.dart';
import 'package:filter/bloc/filter_bloc.dart';
import 'package:filter/screens/filter_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:data/di/di.dart' as di;

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(
        filterInfluencersCollectionUsecase:
            di.sl<FilterInfluencersCollectionUsecase>(),
      ),
      child: const FilterForm(),
    );
  }
}
