part of 'influencers_bloc.dart';

sealed class InfluencersEvent extends Equatable {
  const InfluencersEvent();

  @override
  List<Object> get props => [];
}

class Init extends InfluencersEvent {}
