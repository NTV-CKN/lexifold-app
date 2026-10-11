import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/dto/response/cursor_page_result.dart';
import 'package:lexifold/data/enums/paging_metadata.dart';
import 'package:lexifold/data/source/local/lexi_fold_database.dart';
import 'package:lexifold/providers/study_sets/study_sets_core_provider.dart';

class StudySetPagingState {
  final List<StudySet> items;
  final bool hasNextPage;
  final String? nextCursorId;

  const StudySetPagingState({
    required this.items,
    required this.hasNextPage,
    required this.nextCursorId,
  });

  StudySetPagingState copyWith({
    List<StudySet>? items,
    bool? hasNextPage,
    String? nextCursorId,
  }) {
    return StudySetPagingState(
      items: items ?? this.items,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      nextCursorId: nextCursorId ?? this.nextCursorId,
    );
  }
}

class StudySetPagingNotifier
    extends
        AutoDisposeFamilyAsyncNotifier<
          StudySetPagingState?,
          StudySetPagingEnum
        > {
  static const limit = 20;

  @override
  FutureOr<StudySetPagingState?> build(StudySetPagingEnum arg) async {
    final studySetRepository = ref.read(studySetsRepositoryProvider);
    final result = await studySetRepository.getStudySetsPaging(
      limit: limit,
      key: arg,
      nextCursorId: null,
    );

    return StudySetPagingState(
      items: result.items,
      hasNextPage: result.hasNextPage ?? limit == result.items.length,
      nextCursorId: result.nextCursorId,
    );
  }

  ///Hàm này sẽ dựa vào state hiện tại của Provider theo arg tương
  ///ứng để thực hiện tải trang kế tiếp.
  Future<void> fetchNextPage() async {
    final curState = state.valueOrNull;
    if (state.isLoading || curState == null || !curState.hasNextPage)
      return;

    state = const AsyncLoading<StudySetPagingState?>()
        .copyWithPrevious(state);

    final studySetRepository = ref.read(studySetsRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final studySetPaging = await studySetRepository
          .getStudySetsPaging(
            limit: limit,
            key: arg,
            nextCursorId: curState.nextCursorId,
            forceRefresh: false,
          );

      return curState.copyWith(
        items: [...curState.items, ...studySetPaging.items],
        hasNextPage: studySetPaging.hasNextPage,
        nextCursorId: studySetPaging.nextCursorId,
      );
    });
  }

  StudySetPagingState _toState(CursorPageResult<StudySet> r) {
    return StudySetPagingState(
      items: r.items,
      hasNextPage: r.hasNextPage ?? r.items.length == limit,
      nextCursorId: r.nextCursorId,
    );
  }

  ///Hàm này tiến hành load lại dữ liệu từ đầu (tức xóa mọi thứ
  ///và gọi lên Server lấy dữ liệu về trong trường hợp reCurPage = false)
  Future<void> refresh(bool reCurPage) async {
    final repo = ref.read(studySetsRepositoryProvider);
    state = const AsyncLoading<StudySetPagingState?>()
        .copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final result = await repo.getStudySetsPaging(
        limit: limit,
        key: arg,
        forceRefresh: !reCurPage,
      );
      return _toState(result);
    });
  }
}

final studySetPagingProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      StudySetPagingNotifier,
      StudySetPagingState?,
      StudySetPagingEnum
    >(StudySetPagingNotifier.new);
