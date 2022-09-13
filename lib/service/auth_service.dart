import 'dart:convert';
import 'dart:io';
import 'package:bazarapp/model/report_detail_model.dart';
import 'package:bazarapp/model/report_model.dart';
import 'package:bazarapp/views/report_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Authentification service to login
class AuthService {
  static String url = "http://cashapp.kamtar.uz/";

  static Future<void> login({
    required String username,
    required String password,
    required VoidCallback onLoggedIn,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse("${url}api/token"),
        body: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode != 200) {
        throw HttpException;
      } else {
        var resBody = json.decode(response.body);
        prefs.setString("access", resBody["access"]);
        prefs.setString("refresh", resBody["refresh"]);

        onLoggedIn.call();
      }
    } catch (error) {
      rethrow;
    }
  }

  void getReportType() async {
    late List<ReportModel> _list = [];

    try {
      final response = await http.get(
        Uri.parse("${url}api/101/reports"),
      );
      Iterable list = json.decode(response.body);
      _list = list.map((model) => ReportModel.fromJson(model)).toList();
    } catch (error) {
      rethrow;
    }
  }

  void _getReportType() async {
    bool _isLoading = false;
    double _totalAmount = 0.0;

    late List<ReportDetailModel> _list = [];
    late List<ReportDetailModel> _listSearch = [];

    late ReportDataSource reportDataSource;
    String _searchValue = "";

    try {
      final response = await http.get(
        Uri.parse("${url}api/101/reports/"),
      );
      Iterable list = jsonDecode(utf8.decode(response.bodyBytes));
      _list = list.map((model) => ReportDetailModel.fromJson(model)).toList();
      // _listSearch = _list;
      _listSearch.addAll(_list);
      for (ReportDetailModel model in _list) {
        _totalAmount = _totalAmount + model.summa;
      }
    } catch (error) {
      rethrow;
    }
    reportDataSource = ReportDataSource(reportData: _list);
  }
}
