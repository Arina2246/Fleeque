part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Success extends HomeState {
  final List<InfluencerEntity> influencersCollection;
  const Success({required this.influencersCollection});
}

final class Error extends HomeState {}