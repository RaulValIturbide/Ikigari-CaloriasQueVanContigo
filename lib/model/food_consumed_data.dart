class FoodConsumedData {
  const FoodConsumedData({
    required this.id,
    required this.foodId,
    required this.foodName,
    required this.foodCaloriesPer100g,
    required this.dateAndHour,
    required this.grams,
  });

  final int id;
  final int foodId;
  final String foodName;
  final double foodCaloriesPer100g;
  final DateTime dateAndHour;
  final double grams;

  double get totalCalories => (foodCaloriesPer100g * grams) / 100;
}
