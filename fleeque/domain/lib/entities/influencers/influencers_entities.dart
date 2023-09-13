import 'package:equatable/equatable.dart';

class InfluencerEntity extends Equatable {
  final String name;
  final int posts;
  final int followers;
  final String img;
  final int basicPrice;
  final String time;
  final String country;

  const InfluencerEntity({
    required this.name,
    required this.posts,
    required this.followers,
    required this.img,
    required this.basicPrice,
    required this.time,
    required this.country,
  });

  @override
  List<Object?> get props => [
        name,
        posts,
        followers,
        img,
        basicPrice,
        time,
        country,
      ];
}
