import 'package:lexifold/data/source/local/lexi_fold_database.dart';
import 'package:lexifold/utils/convert.dart';

class VocabularyDto {
  final String id;
  final String studySetId;
  final String term;
  final String definition;
  final String? example;
  final String? imageUrl;
  final String termLanguage;
  final String definitionLanguage;
  final String updatedAt;

  const VocabularyDto(
    this.id,
    this.studySetId,
    this.term,
    this.definition,
    this.example,
    this.imageUrl,
    this.termLanguage,
    this.definitionLanguage,
    this.updatedAt,
  );

  factory VocabularyDto.fromEntity(Vocabulary vocab) => VocabularyDto(
    vocab.id,
    vocab.studySetId,
    vocab.term,
    vocab.definition,
    vocab.example,
    vocab.imageUrl,
    vocab.termLanguage,
    vocab.definitionLanguage,
    ConvertHelper.dateTimeToStrIso8601(vocab.updatedAt),
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "studySetId": studySetId,
      "term": term,
      "definition": definition,
      "example": example,
      "imageUrl": imageUrl,
      "termLanguage": termLanguage,
      "definitionLanguage": definitionLanguage,
      "updatedAt": updatedAt,
    };
  }
}
