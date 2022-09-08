import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  AuthService();

  Future<bool> login(String username, String password) async {
    bool isAuthenticated = false;
    final prefs = await SharedPreferences.getInstance();
    const url = 'http://cashapp.kamtar.uz/api/token/';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"username": username, "password": password},
      );

      if (response.statusCode != 200) {
        throw HttpException;
      } else {
        var resBody = json.decode(response.body);
        prefs.setString("access", resBody["access"]);
        prefs.setString("refresh", resBody["refresh"]);
        isAuthenticated = true;
      }

      return isAuthenticated;
    } catch (error) {
      rethrow;
    }
  }
}
