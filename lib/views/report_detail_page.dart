import 'dart:convert';

import 'package:bazarapp/model/report_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
  String _searchValue = "";

  late List<ReportDetailModel> _list = [];
  late List<ReportDetailModel> _listSearch = [];

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
      // _listSearch = _list;
      _listSearch.addAll(_list);
      for (ReportDetailModel model in _list) {
        _totalAmount = _totalAmount + model.summa;
      }
    } catch (error) {
      rethrow;
    }
    reportDataSource = ReportDataSource(reportData: _list);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  late ReportDataSource reportDataSource;

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Container(
                height: _mainHeight * 0.08,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: _mainHeight * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              padding: const EdgeInsets.only(
                                left: 10.0,
                              ),
                              width: MediaQuery.of(context).size.width * 0.63,
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      _list.clear();
                                      _list.addAll(_listSearch.where(
                                          (element) => element.nomi
                                              .toLowerCase()
                                              .contains(val.toLowerCase())));
                                      reportDataSource =
                                          ReportDataSource(reportData: _list);
                                    });
                                  },
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Nomini kiriting",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: _mainHeight * 0.075,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Jami:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      oCcy.format(_totalAmount),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _mainHeight * 0.845,
                width: MediaQuery.of(context).size.width,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _list.isEmpty
                        ? const Center(
                            child: Text("Hich qanday hisobot yo'q"),
                          )
                        : SfDataGrid(
                            source: reportDataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'nomi',
                                label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text('Nomi'),
                                ),
                              ),
                              GridColumn(
                                columnName: 'summa',
                                label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Summa',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                columnName: 'valyuta',
                                label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text('Valyuta'),
                                ),
                              ),
                              GridColumn(
                                columnName: 'telefon',
                                label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const Text('Telefon'),
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportDataSource extends DataGridSource {
  final oCcy = NumberFormat("#,##0.00", "en_US");

  ReportDataSource({required List<ReportDetailModel> reportData}) {
    _reportData = reportData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'name', value: e.nomi),
              DataGridCell<String>(
                  columnName: 'summa', value: oCcy.format(e.summa)),
              DataGridCell<String>(columnName: 'valyuta', value: e.valyuta),
              DataGridCell<String>(columnName: 'telefon', value: e.telefon),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _reportData = [];

  @override
  List<DataGridRow> get rows => _reportData;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      Color getColor() {
        if (dataGridCell.columnName == 'summa' ||
            dataGridCell.columnName == 'telefon') {
          return Colors.tealAccent.withOpacity(0.4);
        }
        return Colors.transparent;
      }

      return Container(
        color: getColor(),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dataGridCell.value.toString(),
        ),
      );
    }).toList());
  }
}
