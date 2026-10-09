//Esta clase tiene como objetivo guardarse en la bbdd local (sqlite) para almacenar la comida consumida durante los ultimos 15 dias
//Es por eso que no bebe de APIS

class FoodConsumedData {
  FoodConsumedData({
    this.id,
    required this.foodId,
    required this.foodName,
    required this.foodCaloriesPer100g,
    required this.dateAndHour,
    required this.grams,
  });

  final int? id;
  final String foodId;
  final String foodName;
  final double foodCaloriesPer100g;
  final DateTime dateAndHour;
  final double grams;

  double get totalCalories => (foodCaloriesPer100g * grams) / 100;

  Map<String, Object?> toMap() {
    return {
      if (id != null) 'id': id,
      'foodId': foodId,
      'foodName': foodName,
      'foodCaloriesPer100g': foodCaloriesPer100g,
      'dateAndHour': dateAndHour.toIso8601String(),
      'grams': grams,
    };
  }

  factory FoodConsumedData.fromMap(Map<String, Object?> map) {
    return FoodConsumedData(
        id: map['id'] as int,
        foodId: map['foodId'] as String,
        foodName: map['foodName'] as String,
        foodCaloriesPer100g: (map['foodCaloriesPer100g'] as num).toDouble(),
        dateAndHour:DateTime.parse(map['dateAndHour'] as String),
        grams: (map['grams'] as num).toDouble());
  }
}