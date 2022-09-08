import 'dart:convert';
import 'dart:io';
import 'package:bazarapp/model/report_detail_model.dart';
import 'package:bazarapp/model/report_model.dart';
import 'package:bazarapp/views/report_detail_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String url = 'http://cashapp.kamtar.uz/api/token/';
  bool isAuthenticated = false;

  AuthService();

  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

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

  void getReportType() async {
    late List<ReportModel> _list = [];

    const url = 'http://cashapp.kamtar.uz/api/101/reports';
    try {
      final response = await http.get(
        Uri.parse(url),
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

    String url = 'http://cashapp.kamtar.uz/api/101/reports/\${widget.code}';
    try {
      final response = await http.get(
        Uri.parse(url),
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
