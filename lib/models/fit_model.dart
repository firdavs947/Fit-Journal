class FitModel {
  int id;
  double value;
  int kg;

  String? note;

   FitModel({
    required this.id,
    required this.value,
    required this.kg,
    this.note,
  });
  
Map<String, dynamic> toJson() => {
  'id': id,
  'note': note,
  'kg': kg,
  'value': value,
};
}
