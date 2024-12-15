import 'package:get/get.dart';
import 'package:resepin/app/data/data.dart'; // Assuming you have a Menu model in 'data.dart'

class ResultFridgesController extends GetxController {
  // Initialized as an empty list
  List<Menu> menu = [];

  @override
  void onInit() {
    super.onInit();

    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;

    if (arguments is Map<String, dynamic>) {
      if (arguments['menu'] is List<Menu>) {
        menu = List<Menu>.from(arguments['menu']);
      }
    }

    // Alternatively, you can initialize with mock data:
    if (menu.isEmpty) {
      menu = [
        Menu.fromJson({
          "name": "Salad",
          "ingredients": [
            {"name": "lettuce", "quantity": "1", "unit": "head"},
            {"name": "tomatoes", "quantity": "2", "unit": "medium"},
            {"name": "cucumbers", "quantity": "1", "unit": "medium"},
            {"name": "red onions", "quantity": "1/2", "unit": "small"},
            {"name": "olive oil", "quantity": "1", "unit": "tablespoon"},
            {"name": "vinegar", "quantity": "1", "unit": "tablespoon"},
            {"name": "salt", "quantity": "1/4", "unit": "teaspoon"},
            {"name": "pepper", "quantity": "1/4", "unit": "teaspoon"}
          ],
          "instruction":
              "Chop lettuce, tomatoes, cucumbers, and onions. Toss all the ingredients in a bowl. Drizzle with olive oil, vinegar, salt, and pepper. Mix well and serve.",
          "nutrientValue": {
            "calories": "120",
            "protein": "2g",
            "fat": "10g",
            "carbohydrates": "8g",
            "fiber": "2g",
            "sugar": "4g",
            "sodium": "150mg",
            "cholesterol": "0mg"
          }
        }),
        Menu.fromJson({
          "name": "Yogurt",
          "ingredients": [
            {"name": "yogurt", "quantity": "1", "unit": "cup"},
            {"name": "honey", "quantity": "1", "unit": "tablespoon"},
            {"name": "almonds", "quantity": "1/4", "unit": "cup"}
          ],
          "instruction":
              "Scoop yogurt into a bowl. Drizzle with honey and sprinkle almonds on top. Serve immediately.",
          "nutrientValue": {
            "calories": "180",
            "protein": "8g",
            "fat": "9g",
            "carbohydrates": "20g",
            "fiber": "2g",
            "sugar": "17g",
            "sodium": "40mg",
            "cholesterol": "15mg"
          }
        }),
        Menu.fromJson({
          "name": "Egg",
          "ingredients": [
            {"name": "eggs", "quantity": 2, "unit": "large"},
            {"name": "butter", "quantity": "1", "unit": "teaspoon"},
            {"name": "salt", "quantity": "1/4", "unit": "teaspoon"},
            {"name": "pepper", "quantity": "1/4", "unit": "teaspoon"}
          ],
          "instruction":
              "Heat a nonstick skillet over medium heat. Melt butter in the skillet. Crack eggs into the skillet and season with salt and pepper. Cook to your desired level of doneness, then remove and serve.",
          "nutrientValue": {
            "calories": "155",
            "protein": "12g",
            "fat": "11g",
            "carbohydrates": "1g",
            "fiber": "0g",
            "sugar": "1g",
            "sodium": "140mg",
            "cholesterol": "210mg"
          }
        })
      ];
    }
  }
}
