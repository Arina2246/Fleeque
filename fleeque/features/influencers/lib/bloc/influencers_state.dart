part of 'influencers_bloc.dart';

sealed class InfluencersState extends Equatable {
  const InfluencersState();

  @override
  List<Object> get props => [];
}

final class InfluencersInitial extends InfluencersState {}

final class Loading extends InfluencersState {}

final class Success extends InfluencersState {
  final List<InfluencerEntity> influencersCollection;
  const Success({required this.influencersCollection});
}

final class Error extends InfluencersState {}
