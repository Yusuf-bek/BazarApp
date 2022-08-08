class ReportModel {
  final int id;
  final String code;
  final String title;

  ReportModel({required this.id, required this.code, required this.title});

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json['id'],
        code: json['code'],
        title: json['title'],
      );
}
