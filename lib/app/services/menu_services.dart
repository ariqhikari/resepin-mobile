part of 'services.dart';

enum IngredientType { text, image }

class MenuServices {
  // static Future<ApiReturnValue<List<Menu>>> getMenuByIngredients(
  //     IngredientType type, List<String>? ingredients, File? image) async {
  //   http.Client client = http.Client();
  //   String url = "$baseURL/user-creations";

  //   if (type == IngredientType.text) {
  //     var response = await client.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ${User.token}'
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'ingredients': ingredients,
  //       }),
  //     );

  //     var data = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       // Return the parsed data if needed
  //       return ApiReturnValue(value: User.fromJson(data));
  //     } else {
  //       return ApiReturnValue(message: data['message']);
  //     }
  //   } else {
  //     // Convert image to Base64 string
  //     String base64Image = '';
  //     if (image != null && await image.exists()) {
  //       List<int> imageBytes = await image.readAsBytes();
  //       base64Image = base64Encode(imageBytes); // Base64 encode the image bytes
  //     }

  //     var request = http.MultipartRequest('POST', Uri.parse(url))
  //       ..headers['Authorization'] = 'Bearer ${User.token}'
  //       ..fields['base64Image'] = base64Image // Send Base64 string as a field

  //     var response = await request.send();
  //     var responseString = await response.stream.bytesToString();
  //     var data = jsonDecode(responseString);

  //     if (response.statusCode == 200) {
  //       // Handle the data if needed
  //       return ApiReturnValue(value: User.fromJson(data));
  //     } else {
  //       return ApiReturnValue(message: data['message']);
  //     }
  //   }
  // }

  static Future<ApiReturnValue<List<Menu>>> getMenuByIngredients({
    required IngredientType type,
    List<String>? ingredients,
    File? image,
  }) async {
    // Simulate a delay for mock response
    await Future.delayed(const Duration(seconds: 3));

    // Mock API response data
    var response = '''{
    "success": true,
    "message": "Menu creation created successfully",
    "data": [
        {
            "name": "Scrambled Eggs",
            "ingredients": [
                {
                    "name": "eggs",
                    "quantity": 2,
                    "unit": "large"
                },
                {
                    "name": "butter",
                    "quantity": 1,
                    "unit": "tablespoon"
                },
                {
                    "name": "salt",
                    "quantity": "1/4",
                    "unit": "teaspoon"
                },
                {
                    "name": "pepper",
                    "quantity": "1/4",
                    "unit": "teaspoon"
                }
            ],
            "instruction": "Beat eggs in a bowl. Heat butter in a nonstick skillet over medium heat. Pour in eggs and cook, stirring frequently, until cooked through.",
            "nutrientValue": {
                "calories": "165",
                "protein": "13g",
                "fat": "10g",
                "carbohydrates": "1g",
                "fiber": "0g",
                "sugar": "1g",
                "sodium": "186mg",
                "cholesterol": "212mg"
            }
        },
        {
            "name": "Oatmeal",
            "ingredients": [
                {
                    "name": "oats",
                    "quantity": "1/2",
                    "unit": "cup"
                },
                {
                    "name": "water",
                    "quantity": "1",
                    "unit": "cup"
                },
                {
                    "name": "milk",
                    "quantity": "1/2",
                    "unit": "cup"
                },
                {
                    "name": "cinnamon",
                    "quantity": "1/2",
                    "unit": "teaspoon"
                },
                {
                    "name": "sugar",
                    "quantity": "1",
                    "unit": "tablespoon"
                }
            ],
            "instruction": "Combine oats, water, and milk in a saucepan. Bring to a boil, then reduce heat and simmer for 5 minutes, or until oats are cooked through. Stir in cinnamon and sugar. Serve hot.",
            "nutrientValue": {
                "calories": "240",
                "protein": "6g",
                "fat": "5g",
                "carbohydrates": "35g",
                "fiber": "4g",
                "sugar": "6g",
                "sodium": "120mg",
                "cholesterol": "0mg"
            }
        },
        {
            "name": "Salad",
            "ingredients": [
                {
                    "name": "lettuce",
                    "quantity": "1",
                    "unit": "head"
                },
                {
                    "name": "tomatoes",
                    "quantity": "2",
                    "unit": "medium"
                },
                {
                    "name": "carrots",
                    "quantity": "2",
                    "unit": "medium"
                },
                {
                    "name": "cucumber",
                    "quantity": "1",
                    "unit": "medium"
                },
                {
                    "name": "onion",
                    "quantity": "1",
                    "unit": "small"
                },
                {
                    "name": "salad dressing",
                    "quantity": "1/4",
                    "unit": "cup"
                }
            ],
            "instruction": "Chop lettuce, tomatoes, carrots, cucumber, and onion. Combine in a large bowl. Drizzle with salad dressing and toss to coat. Serve cold.",
            "nutrientValue": {
                "calories": "150",
                "protein": "3g",
                "fat": "7g",
                "carbohydrates": "15g",
                "fiber": "3g",
                "sugar": "6g",
                "sodium": "210mg",
                "cholesterol": "0mg"
            }
        }
    ]
}''';

    // Simulating a network response
    var data = jsonDecode(response);

    if (data['success']) {
      // Parse data into List<Menu> object
      List<Menu> menus = (data['data'] as List).map((menuData) {
        return Menu.fromJson(menuData);
      }).toList();

      return ApiReturnValue(value: menus);
    } else {
      return ApiReturnValue(message: data['message']);
    }
  }

  static Future<ApiReturnValue<List<Menu>>> getMenuByFridges({
    required IngredientType type,
    List<String>? ingredients,
    File? image,
  }) async {
    // Simulate a delay for mock response
    await Future.delayed(const Duration(seconds: 3));

    // Mock API response data

    var response = '''{
  "success": true,
  "message": "Menu creation created successfully",
  "data": [
    {
      "name": "Salad",
      "ingredients": [
        {
          "name": "lettuce",
          "quantity": "1",
          "unit": "head"
        },
        {
          "name": "tomatoes",
          "quantity": "2",
          "unit": "medium"
        },
        {
          "name": "cucumbers",
          "quantity": "1",
          "unit": "medium"
        },
        {
          "name": "red onions",
          "quantity": "1/2",
          "unit": "small"
        },
        {
          "name": "olive oil",
          "quantity": "1",
          "unit": "tablespoon"
        },
        {
          "name": "vinegar",
          "quantity": "1",
          "unit": "tablespoon"
        },
        {
          "name": "salt",
          "quantity": "1/4",
          "unit": "teaspoon"
        },
        {
          "name": "pepper",
          "quantity": "1/4",
          "unit": "teaspoon"
        }
      ],
      "instruction": "Chop lettuce, tomatoes, cucumbers, and onions. Toss all the ingredients in a bowl. Drizzle with olive oil, vinegar, salt, and pepper. Mix well and serve.",
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
    },
    {
      "name": "Yogurt",
      "ingredients": [
        {
          "name": "yogurt",
          "quantity": "1",
          "unit": "cup"
        },
        {
          "name": "honey",
          "quantity": "1",
          "unit": "tablespoon"
        },
        {
          "name": "almonds",
          "quantity": "1/4",
          "unit": "cup"
        }
      ],
      "instruction": "Scoop yogurt into a bowl. Drizzle with honey and sprinkle almonds on top. Serve immediately.",
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
    },
    {
      "name": "Egg",
      "ingredients": [
        {
          "name": "eggs",
          "quantity": 2,
          "unit": "large"
        },
        {
          "name": "butter",
          "quantity": "1",
          "unit": "teaspoon"
        },
        {
          "name": "salt",
          "quantity": "1/4",
          "unit": "teaspoon"
        },
        {
          "name": "pepper",
          "quantity": "1/4",
          "unit": "teaspoon"
        }
      ],
      "instruction": "Heat a nonstick skillet over medium heat. Melt butter in the skillet. Crack eggs into the skillet and season with salt and pepper. Cook to your desired level of doneness, then remove and serve.",
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
    }
  ]
}''';

    // Simulating a network response
    var data = jsonDecode(response);

    if (data['success']) {
      // Parse data into List<Menu> object
      List<Menu> menus = (data['data'] as List).map((menuData) {
        return Menu.fromJson(menuData);
      }).toList();

      return ApiReturnValue(value: menus);
    } else {
      return ApiReturnValue(message: data['message']);
    }
  }

  // static Future<ApiReturnValue<List<String>>> getNutrientFacts(
  //     File image) async {
  //   http.Client client = http.Client();
  //   String url = "$baseURL/user-creations/nutrient-facts";

  //   // Convert image to Base64 string
  //   String base64Image = '';
  //   if (await image.exists()) {
  //     List<int> imageBytes = await image.readAsBytes();
  //     base64Image = base64Encode(imageBytes); // Base64 encode the image bytes
  //   }

  //   var request = http.MultipartRequest('POST', Uri.parse(url))
  //     ..headers['Authorization'] = 'Bearer ${User.token}'
  //     ..fields['base64Image'] = base64Image; // Send Base64 string as a field

  //   var response = await request.send();
  //   var responseString = await response.stream.bytesToString();
  //   var data = jsonDecode(responseString);

  //   if (response.statusCode == 200) {
  //     // Handle the data if needed
  //     List<String> nutrientFacts = List<String>.from(data['data'] ?? []);
  //     return ApiReturnValue(value: nutrientFacts);
  //   } else {
  //     return ApiReturnValue(message: data['message']);
  //   }
  // }

  static Future<ApiReturnValue<List<String>>> getNutrientFacts(
      File image) async {
    // Simulate a delay to mimic network request
    await Future.delayed(const Duration(seconds: 3));

    // Mock response data (same as in your example)
    var responseJson = jsonEncode({
      "success": true,
      "message": "Nutrient facts retrieved successfully",
      "data": [
        "Calories,",
        "Total Fat,",
        "Saturated Fat,",
        "Cholesterol,",
        "Sodium,",
        "Total Carb.,",
        "Dietary Fiber,",
        "Total Sugars,",
        "Incl. Added Sugars,",
        "Protein,",
        "Vitamin D,",
        "Calcium,",
        "Iron,",
        "Potassium"
      ]
    });

    // Simulating a successful response
    var response = http.Response(responseJson, 200);

    // Mock handling the response
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // If the request is successful, return the nutrient facts
      List<String> nutrientFacts = List<String>.from(data['data'] ?? []);
      return ApiReturnValue(value: nutrientFacts);
    } else {
      // Return an error if the request fails
      return ApiReturnValue(message: data['message']);
    }
  }

  static Future<ApiReturnValue<List<Menu>>> getUserCreations() async {
    http.Client client = http.Client();
    String url = "$baseURL/user-creations?isFavorite=0";

    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${User.token}'
      },
    );

    var data = jsonDecode(response.body);

    // if (response.statusCode != 200) {
    //   return ApiReturnValue(message: data['message']);
    // }

    List<Menu> menus = (data['data'] as List).map((menuData) {
      return Menu.fromJson(menuData);
    }).toList();

    return ApiReturnValue(value: menus);
  }

  static Future<ApiReturnValue<List<Menu>>> postFavoriteMenu(String id) async {
    http.Client client = http.Client();
    String url = "$baseURL/user-creations?id=$id";

    var response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${User.token}'
      },
    );

    var data = jsonDecode(response.body);

    // if (response.statusCode != 200) {
    //   return ApiReturnValue(message: data['message']);
    // }

    List<Menu> menus = (data['data'] as List).map((menuData) {
      return Menu.fromJson(menuData);
    }).toList();

    return ApiReturnValue(value: menus);
  }
}
