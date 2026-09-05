class VocabularyData {
  final String id;
  final String studySetId;
  final String term;
  final String definition;
  final String? example;
  final String? imageUrl;
  final String termLanguage;
  final String definitionLanguage;
  final DateTime updatedAt;

  const VocabularyData({
    required this.id,
    required this.studySetId,
    required this.term,
    required this.definition,
    this.example,
    this.imageUrl,
    this.termLanguage = 'en',
    this.definitionLanguage = 'vi',
    required this.updatedAt,
  });

  VocabularyData copyWith({
    String? id,
    String? studySetId,
    String? term,
    String? definition,
    String? example,
    String? imageUrl,
    String? termLanguage,
    String? definitionLanguage,
    DateTime? updatedAt,
  }) {
    return VocabularyData(
      id: id ?? this.id,
      studySetId: studySetId ?? this.studySetId,
      term: term ?? this.term,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      imageUrl: imageUrl ?? this.imageUrl,
      termLanguage: termLanguage ?? this.termLanguage,
      definitionLanguage:
          definitionLanguage ?? this.definitionLanguage,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory VocabularyData.fromData(Map<String, dynamic> data) {
    return VocabularyData(
      id: data['id'] as String,
      studySetId: data['studySetId'] as String,
      term: data['term'] as String,
      definition: data['definition'] as String,
      example: data['example'] as String?,
      imageUrl: data['imageUrl'] as String?,
      termLanguage: data['termLanguage'] as String? ?? 'en',
      definitionLanguage:
          data['definitionLanguage'] as String? ?? 'vi',
      updatedAt: data['updatedAt'] is DateTime
          ? data['updatedAt'] as DateTime
          : DateTime.parse(data['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'id': id,
      'studySetId': studySetId,
      'term': term,
      'definition': definition,
      'example': example,
      'imageUrl': imageUrl,
      'termLanguage': termLanguage,
      'definitionLanguage': definitionLanguage,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
