part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<InfluencerEntity> influencersCollection;
  final bool isLoading;
  final bool isError;
  const HomeState(
      {required this.influencersCollection,
      required this.isLoading,
      required this.isError});

  @override
  List<Object> get props => [influencersCollection, isLoading, isError];
}
