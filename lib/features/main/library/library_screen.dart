import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/features/main/library/widgets/set/set_content.dart';
import 'package:lexifold/l10n/app_localizations.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  void _showCreateBottomSheet(
    BuildContext context,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //CREATE SET
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.menu_book_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      l10n.textSet,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //CREATE FOLDER
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.folder_copy_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      l10n.textFolder,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.textLibrary,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 26,
                width: 26,
                child: IconButton(
                  onPressed: () => _showCreateBottomSheet(
                    context,
                    colorScheme,
                    l10n,
                  ),
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ],
          bottom: TabBar(
            padding: const EdgeInsets.all(8),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            tabs: [
              Tab(text: l10n.textSet),
              Tab(text: l10n.textFolder),
              Tab(text: l10n.textVocabScan),
              Tab(text: l10n.textFavorite),
            ],
            indicator: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withAlpha(35),
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: [
            const SetContent(),
            Center(child: Text(l10n.textFolder)),
            Center(child: Text(l10n.textVocabScan)),
            Center(child: Text(l10n.textFavorite)),
          ],
        ),
      ),
    );
  }
}
