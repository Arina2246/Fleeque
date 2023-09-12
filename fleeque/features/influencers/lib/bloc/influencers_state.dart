part of 'influencers_bloc.dart';

class InfluencersState extends Equatable {
  final List<InfluencerEntity> influencersCollection;
  final bool isLoading;
  final bool isError;
  const InfluencersState(
      {required this.influencersCollection,
      required this.isLoading,
      required this.isError});

  @override
  List<Object> get props => [influencersCollection, isLoading, isError];
}
