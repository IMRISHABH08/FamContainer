
import 'package:equatable/equatable.dart';

class BgImage extends Equatable {
  const BgImage({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });

  final String imageType;
  final String imageUrl;
  final double aspectRatio;

  @override
  List<Object?> get props => [];
}
