import 'dart:convert';
import 'package:bazarapp/views/report_detail_page.dart';
import 'package:flutter/material.dart';
import '../model/report_model.dart';
import 'package:http/http.dart' as http;

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  double _mainHeight = 0.0;
  bool _isLoading = false;

  late List<ReportModel> _list = [];

  void _getReportType() async {
    setState(() {
      _isLoading = true;
    });
    const url = 'http://cashapp.kamtar.uz/api/101/reports';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      Iterable list = json.decode(response.body);
      _list = list.map((model) => ReportModel.fromJson(model)).toList();
      if (response.statusCode == 200) {
      } else {}
    } catch (error) {
      rethrow;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getReportType();
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              height: _mainHeight * 0.1,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Hisobot turlari",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _mainHeight * 0.9,
              width: MediaQuery.of(context).size.width * 0.85,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _list.isEmpty
                      ? const Center(
                          child: Text("Hich qanday hisobot yo'q"),
                        )
                      : ListView.builder(
                          itemCount: _list.length,
                          shrinkWrap: true,
                          itemBuilder: (ctn, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportDetailPage(
                                          code: _list[index].code),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: index % 4 == 0
                                        ? const Color(0xFFC7B6F9)
                                        : index % 3 == 0
                                            ? const Color(0xFFFFDAEB)
                                            : index % 2 == 0
                                                ? const Color(0xFFFDF1A9)
                                                : const Color(0xFFDAF7FF),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(_list[index].title),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
