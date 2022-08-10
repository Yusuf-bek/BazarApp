import 'dart:convert';

import 'package:bazarapp/model/report_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ReportDetailPage extends StatefulWidget {
  final String code;

  const ReportDetailPage({Key? key, required this.code}) : super(key: key);

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  double _mainHeight = 0.0;
  bool _isLoading = false;
  double _totalAmount = 0.0;
  final oCcy = NumberFormat("#,##0.00", "en_US");

  late List<ReportDetailModel> _list = [];

  void _getReportType() async {
    setState(() {
      _isLoading = true;
    });
    String url = 'http://cashapp.kamtar.uz/api/101/reports/${widget.code}';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      Iterable list = jsonDecode(utf8.decode(response.bodyBytes));
      _list = list.map((model) => ReportDetailModel.fromJson(model)).toList();

      for (ReportDetailModel model in _list) {
        _totalAmount = _totalAmount + model.summa;
      }
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
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "${widget.code} kodli hisobot",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jami:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(oCcy.format(_totalAmount)),
                ],
              ),
            ),
            SizedBox(
              height: _mainHeight * 0.82,
              width: MediaQuery.of(context).size.width,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _list.isEmpty
                      ? const Center(
                          child: Text("Hich qanday hisobot yo'q"),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              sortAscending: true,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Nomi',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Telefon',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Summa',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Valyuta',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                              rows: _list.map(
                                ((element) {
                                  return DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          element.nomi,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          element.telefon,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          oCcy.format(element.summa),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          element.valyuta,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ).toList(),
                            ),
                          ),
                        ),
              // : ListView.builder(
              //     itemCount: _list.length,
              //     shrinkWrap: true,
              //     itemBuilder: (ctn, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(
              //             top: 15.0, bottom: 15.0),
              //         child: Container(
              //           height: 100,
              //           decoration: BoxDecoration(
              //             color: Color(0xFFC7B6F9).withOpacity(0.15),
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Column(
              //               crossAxisAlignment:
              //                   CrossAxisAlignment.start,
              //               mainAxisAlignment:
              //                   MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Text("Nomi: ${_list[index].nomi}"),
              //                 Text(
              //                     "Summasi: ${oCcy.format(_list[index].summa)}  ${_list[index].valyuta}"),
              //                 Text(
              //                     "Telefon raqami: ${_list[index].telefon}"),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
