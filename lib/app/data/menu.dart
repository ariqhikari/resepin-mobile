part of 'data.dart';

class Menu {
  final String name;
  final List<Ingedient> ingredients;
  final String instruction;
  final Nutrient nutrient;
  bool isFavorite;

  Menu({
    required this.name,
    required this.ingredients,
    required this.instruction,
    required this.nutrient,
    this.isFavorite = false,
  });

  factory Menu.fromJson(Map<String, dynamic> data) => Menu(
        name: data['name'],
        ingredients: List<Ingedient>.from(
          data['ingredients'].map((x) => Ingedient.fromJson(x)),
        ),
        instruction: data['instruction'],
        nutrient: Nutrient.fromJson(data['nutrientValue']),
        isFavorite: data['isFavorite'] ?? false,
      );

  Menu copyWith({
    String? name,
    List<Ingedient>? ingredients,
    String? instruction,
    Nutrient? nutrient,
    bool? isFavorite,
  }) =>
      Menu(
        name: name ?? this.name,
        ingredients: ingredients ?? this.ingredients,
        instruction: instruction ?? this.instruction,
        nutrient: nutrient ?? this.nutrient,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

class Ingedient {
  final String name;
  final String quantity;
  final String unit;

  const Ingedient({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory Ingedient.fromJson(Map<String, dynamic> data) => Ingedient(
        name: data['name'],
        quantity: data['quantity'].toString(),
        unit: data['unit'],
      );

  Ingedient copyWith({
    String? name,
    String? quantity,
    String? unit,
  }) =>
      Ingedient(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );
}

class Nutrient {
  final String calories;
  final String protein;
  final String fat;
  final String carbohydrates;
  final String fiber;
  final String sugar;
  final String sodium;
  final String cholesterol;

  const Nutrient({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.fiber,
    required this.sugar,
    required this.sodium,
    required this.cholesterol,
  });

  factory Nutrient.fromJson(Map<String, dynamic> data) => Nutrient(
        calories: data['calories'],
        protein: data['protein'],
        fat: data['fat'],
        carbohydrates: data['carbohydrates'],
        fiber: data['fiber'],
        sugar: data['sugar'],
        sodium: data['sodium'],
        cholesterol: data['cholesterol'],
      );

  Nutrient copyWith({
    String? calories,
    String? protein,
    String? fat,
    String? carbohydrates,
    String? fiber,
    String? sugar,
    String? sodium,
    String? cholesterol,
  }) =>
      Nutrient(
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fiber: fiber ?? this.fiber,
        sugar: sugar ?? this.sugar,
        sodium: sodium ?? this.sodium,
        cholesterol: cholesterol ?? this.cholesterol,
      );
}
