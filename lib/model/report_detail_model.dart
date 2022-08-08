class ReportDetailModel {
  final int id;
  final String nomi;
  final String telefon;
  final double summa;
  final String valyuta;

  ReportDetailModel({
    required this.id,
    required this.nomi,
    required this.telefon,
    required this.summa,
    required this.valyuta,
  });

  factory ReportDetailModel.fromJson(Map<String, dynamic> json) => ReportDetailModel(
    id: json['ID'] ?? 0,
    nomi: json['NOMI'] ?? "",
    telefon: json['TELEFON'] ?? "",
    summa: json['SUMMA'] ?? 0.0,
    valyuta: json['Valyuta'] ?? "",
  );
}
