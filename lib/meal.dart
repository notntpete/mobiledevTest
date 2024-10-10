class Meal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final List<String?> ingredients;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      ingredients: List<String?>.generate(
          20, (index) => json['strIngredient${index + 1}'] as String?),
    );
  }

  List<String?> getIngredients() {
    return ingredients
        .where((ingredient) => ingredient != null && ingredient.isNotEmpty)
        .toList();
  }
}
