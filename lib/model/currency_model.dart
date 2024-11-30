class CurrencyModel {
  const CurrencyModel({
    required this.id,
    required this.ccy,
    required this.name,
    required this.rate,
    required this.date,
    required this.diff,
  });

  final int id;
  final String ccy;
  final String name;
  final String rate;
  final String diff;
  final String date;

 static CurrencyModel fromJson(Map<String, Object?> json) {
    return CurrencyModel(
      id: json['id'] as int,
      ccy: json['Ccy'] as String,
      name: json['CcyNm_EN'] as String,
      rate: json['Rate'] as String,
      date: json['Date'] as String,
      diff: json['Diff'] as String,
    );
  }


}
