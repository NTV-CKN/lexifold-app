import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/enums/paging_metadata.dart';
import 'package:lexifold/exts/list_study_set_ext.dart';
import 'package:lexifold/l10n/app_localizations.dart';
import 'package:lexifold/providers/study_sets/study_set_paging_provider.dart';

import '../../../utils/show_progress_dialog.dart';

class PagingStudySet extends ConsumerStatefulWidget {
  final StudySetPagingEnum categoryKey;

  const PagingStudySet(this.categoryKey);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PagingStudySetState();
  }
}

class _PagingStudySetState extends ConsumerState<PagingStudySet> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(this._onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final studySetsProv = ref.watch(
      studySetPagingProvider(widget.categoryKey),
    );

    return studySetsProv.when(
      data: (state) {
        final flatGroupedStudySet =
            state?.items.flatGroupedStudySet() ?? [];

        if (flatGroupedStudySet.isEmpty || state == null) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.numbers, size: 20),
                const SizedBox(width: 8),
                Text(
                  l10n.textStudySetIsEmpty,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.hintSearch,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: flatGroupedStudySet.length,
                controller: _scrollController,
                itemBuilder: (ctx, index) {
                  //Giả sử khi load đến cuối và vẫn còn trang kế tiếp,
                  //ta tiến hành + 1 cho index của item cuối cùng để hiện
                  //progress loading
                  final compareLength = state.hasNextPage
                      ? index + 1
                      : index;
                  if (compareLength == flatGroupedStudySet.length) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: const CircularProgressIndicator(),
                    );
                  }

                  final item = flatGroupedStudySet[index];

                  return switch (item) {
                    HeaderRowItem(:final monthYear) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "${monthYear.month}/${monthYear.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DataRowItem(:final studySet) => ListTile(
                      title: Text(
                        studySet.title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      leading: const Icon(Icons.menu_book_outlined),
                      subtitle: Text(
                        studySet.isPublic
                            ? l10n.textPublic
                            : l10n.textPrivate,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: Icon(Icons.more_horiz_outlined),
                    ),
                  };
                },
              ),
            ),
          ],
        );
      },
      error: (err, trace) {
        return Center(child: Text(err.toString()));
      },
      loading: () {
        return ShowProgressDialog.dialogLoadingWidget(context);
      },
    );
  }

  _onScroll() {
    if (_scrollController.position.maxScrollExtent - 200 <=
        _scrollController.position.pixels) {
      ref
          .read(studySetPagingProvider(widget.categoryKey).notifier)
          .fetchNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
