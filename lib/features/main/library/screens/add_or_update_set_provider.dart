import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/enums/sync_option.dart';
import 'package:lexifold/data/model/set/study_set_data.dart';
import 'package:lexifold/data/model/set/vocab_item.dart';
import 'package:lexifold/data/model/set/vocabulary_data.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

///Start-FormState: Đây là phần quản lí danh sách các card khi người dùng nhập liệu và xóa sửa
class StudySetFormState {
  final StudySetData studySetData;
  final List<VocabItem> cards;

  StudySetFormState({
    required this.studySetData,
    required this.cards,
  });

  StudySetFormState copyWith({
    StudySetData? studySetData,
    List<VocabItem>? cards,
  }) {
    return StudySetFormState(
      studySetData: studySetData ?? this.studySetData,
      cards: cards ?? this.cards,
    );
  }
}

class StudySetFormStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          StudySetFormState,
          (String idSet, bool isUpdate)
        > {
  VocabItem? addCard() {
    final formState = state.valueOrNull;
    if (formState != null) {
      final vocabItem = _createVocabItem(formState.studySetData.id);
      final updatedCards = [...formState.cards, vocabItem];
      state = AsyncData(
        formState.copyWith(
          cards: updatedCards,
          studySetData: formState.studySetData.copyWith(),
        ),
      );

      return vocabItem;
    }

    return null;
  }

  @override
  FutureOr<StudySetFormState> build((String, bool) args) {
    ref.onDispose(() {
      final studyFormState = state.valueOrNull;
      if (studyFormState != null) {
        for (final card in studyFormState.cards) {
          card.dispose();
        }
      }
    });
    // if (arg == null) {
    final studySetId = args.$1 as String;

    final cards = [
      _createVocabItem(studySetId),
      _createVocabItem(studySetId),
    ];
    final studySetData = StudySetData(
      id: studySetId,
      title: "NoName",
      syncStatus: SyncOption.initialize.typeName,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return StudySetFormState(
      studySetData: studySetData,
      cards: cards,
    );
    // }
  }
}

final studySetFormStateProvider = AsyncNotifierProvider.autoDispose
    .family<
      StudySetFormStateNotifier,
      StudySetFormState,
      (String, bool)
    >(StudySetFormStateNotifier.new);

///End-FormState

///Các hàm phụ trợ
VocabItem _createVocabItem(String idSet) {
  return VocabItem(
    VocabularyData(
      id: uuid.v4(),
      studySetId: idSet,
      term: "",
      definition: "",
      updatedAt: DateTime.now(),
    ),
    defineFocus: FocusNode(),
    termFocus: FocusNode(),
  );
}
