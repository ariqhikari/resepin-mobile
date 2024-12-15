part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    http.Client client = http.Client();
    String url = "$baseURL/auth/login";

    var response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['message']);
    }

    String token = data['data']['token'];
    saveToken(token);

    User.token = token;
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(
      String name, String email, String password) async {
    http.Client client = http.Client();
    String url = "$baseURL/auth/register";

    var response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['message']);
    }

    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static void signOut() async {
    removeToken();
  }
}
