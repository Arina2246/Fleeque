import 'package:equatable/equatable.dart';

class InfluencerEntity extends Equatable {
  final String name;
  final int posts;
  final int followers;
  final String imgBig;
  final String imgSmall;

  const InfluencerEntity({
    required this.name,
    required this.posts,
    required this.followers,
    required this.imgBig,
    required this.imgSmall,
  });

  @override
  List<Object?> get props => [
        name,
        posts,
        followers,
        imgBig,
        imgSmall,
      ];
}
