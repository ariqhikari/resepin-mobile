part of 'services.dart';

enum IngredientType { text, image }

class MenuServices {
  static Future<ApiReturnValue<List<Menu>>> getMenuByIngredients({
    required IngredientType type,
    List<String>? ingredients,
    File? image,
  }) async {
    http.Client client = http.Client();
    String url = "$baseURL/user-creations";

    if (type == IngredientType.text) {
      var response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${User.token}'
        },
        body: jsonEncode(<String, dynamic>{
          'ingredients': ingredients,
        }),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Menu> menus = (data['data'] as List).map((menuData) {
          return Menu.fromJson(menuData);
        }).toList();

        return ApiReturnValue(value: menus);
      } else {
        return ApiReturnValue(message: data['message']);
      }
    } else {
      String base64Image = '';
      if (image != null && await image.exists()) {
        List<int> imageBytes = await image.readAsBytes();
        base64Image = base64Encode(imageBytes);
      }

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers['Authorization'] = 'Bearer ${User.token}'
        ..fields['base64Image'] = base64Image;

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var data = jsonDecode(responseString);

      if (response.statusCode == 200) {
        // Handle the data if needed
        List<Menu> menus = (data['data'] as List).map((menuData) {
          return Menu.fromJson(menuData);
        }).toList();

        return ApiReturnValue(value: menus);
      } else {
        return ApiReturnValue(message: data['message']);
      }
    }
  }

  static Future<ApiReturnValue<List<Menu>>> getMenuByFridges({
    required IngredientType type,
    required File image,
  }) async {
    http.Client client = http.Client();
    String url = "$baseURL/user-creations";

    String base64Image = '';
    if (await image.exists()) {
      List<int> imageBytes = await image.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers['Authorization'] = 'Bearer ${User.token}'
      ..fields['base64Image'] = base64Image;

    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    var data = jsonDecode(responseString);

    if (response.statusCode == 200) {
      // Handle the data if needed
      List<Menu> menus = (data['data'] as List).map((menuData) {
        return Menu.fromJson(menuData);
      }).toList();

      return ApiReturnValue(value: menus);
    } else {
      return ApiReturnValue(message: data['message']);
    }
  }

  static Future<ApiReturnValue<List<String>>> getNutrientFacts(
      File image) async {
    http.Client client = http.Client();
    String url = "$baseURL/user-creations/nutrient-facts";

    // Convert image to Base64 string
    String base64Image = '';
    if (await image.exists()) {
      List<int> imageBytes = await image.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers['Authorization'] = 'Bearer ${User.token}'
      ..fields['base64Image'] = base64Image;

    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    var data = jsonDecode(responseString);

    if (response.statusCode == 200) {
      // Handle the data if needed
      List<String> nutrientFacts = List<String>.from(data['data'] ?? []);
      return ApiReturnValue(value: nutrientFacts);
    } else {
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

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['message']);
    }

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

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['message']);
    }

    List<Menu> menus = (data['data'] as List).map((menuData) {
      return Menu.fromJson(menuData);
    }).toList();

    return ApiReturnValue(value: menus);
  }
}
