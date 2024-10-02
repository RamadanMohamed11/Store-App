class RatingModel {
  final num rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  // Safely handle null rating
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData?['rate'] ?? 0.0, // Default to 0.0 if null
      count: jsonData?['count'] ?? 0, // Default to 0 if null
    );
  }
}
