import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Future<int> login(String username, String password) async {
    int status = 0;
    final prefs = await SharedPreferences.getInstance();
    const url = 'http://cashapp.kamtar.uz/api/token/';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {"username": username, "password": password},
      );
      print(response.body);
      var resBody = json.decode(response.body);
      if (response.statusCode != 200) {
        status = 1;
        throw HttpException;
      } else {
        prefs.setString("access", resBody["access"]);
        prefs.setString("refresh", resBody["refresh"]);
      }
      return status;
    } catch (error) {
      rethrow;
    }
  }
}
