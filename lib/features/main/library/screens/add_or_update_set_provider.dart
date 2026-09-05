import 'dart:async';

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
}

class StudySetFormStateNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<StudySetFormState, String?> {
  @override
  FutureOr<StudySetFormState> build(String? arg) {
    ref.onDispose(() {
      final studyFormState = state.valueOrNull;
      if (studyFormState != null) {
        for (final card in studyFormState.cards) {
          card.dispose();
        }
      }
    });
    // if (arg == null) {
    final studySetId = uuid.v4();

    final cards = [
      VocabItem(
        VocabularyData(
          id: uuid.v4(),
          definition: "",
          term: "",
          studySetId: studySetId,
          updatedAt: DateTime.now(),
        ),
      ),

      VocabItem(
        VocabularyData(
          id: uuid.v4(),
          definition: "",
          term: "",
          studySetId: studySetId,
          updatedAt: DateTime.now(),
        ),
      ),
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
    .family<StudySetFormStateNotifier, StudySetFormState, String?>(
      StudySetFormStateNotifier.new,
    );

///End-FormState
