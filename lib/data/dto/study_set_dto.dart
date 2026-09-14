import 'package:lexifold/data/dto/vocabulary_dto.dart';
import 'package:lexifold/utils/convert.dart';

import '../source/local/lexi_fold_database.dart';

class StudySetDto {
  final String id;
  final String title;
  final String? subDescription;
  final bool isPublic;
  final String sourceLanguage;
  final String targetLanguage;
  final String createdAt;
  final String updatedAt;
  final List<VocabularyDto> vocabularies;

  const StudySetDto({
    required this.id,
    required this.title,
    this.subDescription,
    required this.isPublic,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.createdAt,
    required this.updatedAt,
    required this.vocabularies,
  });

  factory StudySetDto.fromEntity(
    StudySet s,
    List<Vocabulary> vocabs,
  ) => StudySetDto(
    id: s.id,
    title: s.title,
    subDescription: s.subDescription,
    isPublic: s.isPublic,
    sourceLanguage: s.sourceLanguage,
    targetLanguage: s.targetLanguage,
    createdAt: ConvertHelper.dateTimeToStrIso8601(s.createdAt),
    updatedAt: ConvertHelper.dateTimeToStrIso8601(s.updatedAt),
    vocabularies: vocabs.map(VocabularyDto.fromEntity).toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subDescription': subDescription,
    'isPublic': isPublic,
    'sourceLanguage': sourceLanguage,
    'targetLanguage': targetLanguage,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'vocabularies': vocabularies.map((v) => v.toJson()).toList(),
  };
}
