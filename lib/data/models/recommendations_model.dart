import '../../domain/entities/recommendation.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.id, super.backdropPath});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json['id'],
        backdropPath:
            json['backdrop_path'] ?? "/3dxYKO3yRV2EIqUlqECfKEWeWYo.jpg",
      );
}
