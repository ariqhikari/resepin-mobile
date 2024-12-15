import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/services/services.dart';
import 'package:resepin/app/shared/shared.dart';

class MainController extends GetxController {
  late PageController pageController;
  var selectedPage = 0.obs;
  RxBool isLoading = false.obs;

  final TextEditingController ingredientController = TextEditingController();
  var ingredients = <String>[].obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPage.value);
    super.onInit();
  }

  void addIngredient() {
    if (ingredientController.text.isNotEmpty) {
      ingredients.add(ingredientController.text);
      ingredientController.clear();
    }
  }

  void removeIngredient(String ingredient) {
    ingredients.remove(ingredient);
  }

  Future<void> getMenuByIngredient() async {
    isLoading.value = true;
    ApiReturnValue<List<Menu>> result = await MenuServices.getMenuByIngredients(
      type: IngredientType.text,
      ingredients: ingredients,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.toNamed(
      Routes.RESULT_INGREDIENTS,
      arguments: {
        'ingredients': ingredients,
        'menu': result.value,
      },
    );
  }

  List<Menu> menuCreations = [
    Menu(
      name: "Salad Buah Pisang Mangga Keju Susu",
      ingredients: [
        const Ingedient(name: "Pisang", quantity: "2", unit: "buah"),
        const Ingedient(name: "Mangga", quantity: "1", unit: "buah"),
        const Ingedient(name: "Keju", quantity: "100", unit: "gram"),
      ],
      instruction: "Campurkan semua bahan.",
      nutrient: const Nutrient(
        calories: "190",
        protein: "3g",
        fat: "5g",
        carbohydrates: "30g",
        fiber: "2g",
        sugar: "12g",
        sodium: "10mg",
        cholesterol: "0mg",
      ),
    ),
    Menu(
      name: "Nasi Goreng Ayam",
      ingredients: [
        const Ingedient(name: "Nasi Putih", quantity: "1", unit: "piring"),
        const Ingedient(name: "Ayam Fillet", quantity: "100", unit: "gram"),
        const Ingedient(name: "Telur", quantity: "1", unit: "butir"),
        const Ingedient(
            name: "Kecap Manis", quantity: "2", unit: "sendok makan"),
        const Ingedient(name: "Bawang Merah", quantity: "2", unit: "siung"),
        const Ingedient(name: "Bawang Putih", quantity: "2", unit: "siung"),
        const Ingedient(
            name: "Minyak Goreng", quantity: "2", unit: "sendok makan"),
        const Ingedient(name: "Cabe Merah", quantity: "2", unit: "buah"),
      ],
      instruction:
          "Tumis bawang merah dan bawang putih hingga harum, masukkan ayam dan telur. Tambahkan nasi, kecap manis, dan cabe. Aduk rata.",
      nutrient: const Nutrient(
        calories: "450",
        protein: "20g",
        fat: "18g",
        carbohydrates: "50g",
        fiber: "3g",
        sugar: "5g",
        sodium: "800mg",
        cholesterol: "40mg",
      ),
    ),
  ];

  List<Menu> menuPlan = [
    Menu(
      name: "Roti Bakar dengan Selai Kacang",
      ingredients: [
        const Ingedient(name: "Roti Tawar", quantity: "2", unit: "lembar"),
        const Ingedient(
            name: "Selai Kacang", quantity: "2", unit: "sendok makan"),
        const Ingedient(name: "Pisang", quantity: "1", unit: "buah"),
        const Ingedient(name: "Mentega", quantity: "1", unit: "sendok makan"),
      ],
      instruction:
          "Oleskan mentega di atas roti, panggang hingga kecokelatan, lalu oleskan selai kacang dan tambahkan irisan pisang di atasnya.",
      nutrient: const Nutrient(
        calories: "250",
        protein: "7g",
        fat: "12g",
        carbohydrates: "30g",
        fiber: "3g",
        sugar: "15g",
        sodium: "200mg",
        cholesterol: "5mg",
      ),
    ),
    Menu(
      name: "Smoothie Berry",
      ingredients: [
        const Ingedient(name: "Strawberry", quantity: "100", unit: "gram"),
        const Ingedient(name: "Blueberry", quantity: "50", unit: "gram"),
        const Ingedient(name: "Yoghurt", quantity: "200", unit: "gram"),
        const Ingedient(name: "Madu", quantity: "1", unit: "sendok makan"),
        const Ingedient(name: "Es Batu", quantity: "1", unit: "gelas"),
      ],
      instruction: "Blender semua bahan hingga halus.",
      nutrient: const Nutrient(
        calories: "180",
        protein: "4g",
        fat: "1g",
        carbohydrates: "35g",
        fiber: "3g",
        sugar: "25g",
        sodium: "30mg",
        cholesterol: "0mg",
      ),
    ),
  ];

  List<Menu> menuFavorite = [
    Menu.fromJson({
      "name": "Salad",
      "ingredients": [
        {"name": "lettuce", "quantity": "1", "unit": "head"},
        {"name": "tomatoes", "quantity": "2", "unit": "medium"},
        {"name": "carrots", "quantity": "2", "unit": "medium"},
        {"name": "cucumber", "quantity": "1", "unit": "medium"},
        {"name": "onion", "quantity": "1", "unit": "small"},
        {"name": "salad dressing", "quantity": "1/4", "unit": "cup"}
      ],
      "instruction":
          "Chop lettuce, tomatoes, carrots, cucumber, and onion. Combine in a large bowl. Drizzle with salad dressing and toss to coat. Serve cold.",
      "nutrientValue": {
        "calories": "150",
        "protein": "3g",
        "fat": "7g",
        "carbohydrates": "15g",
        "fiber": "3g",
        "sugar": "6g",
        "sodium": "210mg",
        "cholesterol": "0mg"
      },
      "isFavorite": true, // Added a default for isFavorite
    }),
    Menu(
      name: "Nasi Goreng Ayam",
      ingredients: [
        const Ingedient(name: "Nasi Putih", quantity: "1", unit: "piring"),
        const Ingedient(name: "Ayam Fillet", quantity: "100", unit: "gram"),
        const Ingedient(name: "Telur", quantity: "1", unit: "butir"),
        const Ingedient(
            name: "Kecap Manis", quantity: "2", unit: "sendok makan"),
        const Ingedient(name: "Bawang Merah", quantity: "2", unit: "siung"),
        const Ingedient(name: "Bawang Putih", quantity: "2", unit: "siung"),
        const Ingedient(
            name: "Minyak Goreng", quantity: "2", unit: "sendok makan"),
        const Ingedient(name: "Cabe Merah", quantity: "2", unit: "buah"),
      ],
      instruction:
          "Tumis bawang merah dan bawang putih hingga harum, masukkan ayam dan telur. Tambahkan nasi, kecap manis, dan cabe. Aduk rata.",
      nutrient: const Nutrient(
        calories: "450",
        protein: "20g",
        fat: "18g",
        carbohydrates: "50g",
        fiber: "3g",
        sugar: "5g",
        sodium: "800mg",
        cholesterol: "40mg",
      ),
      isFavorite: true, // You should also handle the 'isFavorite' field
    ),
  ];
}
