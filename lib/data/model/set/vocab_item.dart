import 'package:flutter/widgets.dart';
import 'package:lexifold/data/model/set/vocabulary_data.dart';

///Lớp này được sử dụng cho các chức năng thêm từ vựng, giúp quản
///lí danh sách các từ vựng và cho phép chuyển focus bàn phím đến item tương ứng
class VocabItem {
  final VocabularyData vocabulary;
  final FocusNode? termFocus;
  final FocusNode? defineFocus;

  VocabItem(this.vocabulary, {this.termFocus, this.defineFocus});

  void dispose() {
    termFocus?.dispose();
    defineFocus?.dispose();
  }
}
