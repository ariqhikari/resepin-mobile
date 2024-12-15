part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    http.Client client = http.Client();
    String url = "$baseURL/auth/login";

    // var response = await client.post(
    //   Uri.parse(url),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(<String, String>{
    //     'email': email,
    //     'password': password,
    //   }),
    // );

    // var data = jsonDecode(response.body);
    var response = '''{
      "success": true,
      "message": "Login successful",
      "data": {
        "user": {
          "id": "a330209a-aa22-4193-8ead-658d6d82780d",
          "name": "Indraaa",
          "email": "iwahyu809@gmail.com",
          "createdAt": "2024-12-14T19:59:39.000Z",
          "updatedAt": "2024-12-14T19:59:39.000Z"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImEzMzAyMDlhLWFhMjItNDE5My04ZWFkLTY1OGQ2ZDgyNzgwZCIsImlhdCI6MTczNDIwNjUzNSwiZXhwIjoxNzM0MjEwMTM1fQ.tF6sZkNZhXMNuVQFyV8iNXkLA6zoQfxwL_2RmJs-7zU"
      }
    }''';
    var data = jsonDecode(response);

    // if (response.statusCode != 200) {
    //   return ApiReturnValue(message: data['message']);
    // }

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

    // if (response.statusCode != 200) {
    //   return ApiReturnValue(message: data['message']);
    // }

    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static void signOut() async {
    removeToken();
  }
}
