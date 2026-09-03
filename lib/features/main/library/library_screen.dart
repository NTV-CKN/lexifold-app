import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/l10n/app_localizations.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

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
                child: Icon(Icons.add),
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
            Center(child: Text(l10n.textSet)),
            Center(child: Text(l10n.textFolder)),
            Center(child: Text(l10n.textVocabScan)),
            Center(child: Text(l10n.textFavorite)),
          ],
        ),
      ),
    );
  }
}
