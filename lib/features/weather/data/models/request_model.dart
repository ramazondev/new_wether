
class RequestModel {
  final String type;
  final String query;
  final String language;
  final String unit;

  const RequestModel({
    this.type = '',
    this.query = '',
    this.language = '',
    this.unit = '',
  });
  factory RequestModel.fromJson(Map<String,Object?>json){

    return RequestModel(
        type : json['type'] as String? ?? '',
        query : json['query'] as String? ?? '',
        language : json['language'] as String? ?? '',
        unit : json['unit'] as String ? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    return {
      'type': type,
      'query': query,
      'language': language,
      'unit': unit,
    };
  }

  @override
  String toString() {
    return 'RequestModel{'
        'type: $type, '
        'query: $query, '
        'language: $language, '
        'unit: $unit,}';
  }
}
