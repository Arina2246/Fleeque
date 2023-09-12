part of 'influencers_bloc.dart';

sealed class InfluencersEvent {
  InfluencersEvent();
}

class Init extends InfluencersEvent {}

class Filter extends InfluencersEvent {
  final Map<String, dynamic> filterData;
  Filter(this.filterData);
}
