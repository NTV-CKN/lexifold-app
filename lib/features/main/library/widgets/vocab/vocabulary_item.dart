import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/model/set/vocab_item.dart';
import 'package:lexifold/features/main/library/screens/add_or_update_set_provider.dart';

class VocabularyItemTile extends ConsumerStatefulWidget {
  final int index;
  final VocabItem item;
  final String? setId;

  const VocabularyItemTile({
    super.key,
    required this.index,
    required this.item,
    this.setId,
  });

  @override
  ConsumerState<VocabularyItemTile> createState() =>
      _VocabularyItemTileState();
}

class _VocabularyItemTileState
    extends ConsumerState<VocabularyItemTile> {
  late final TextEditingController _termController;
  late final TextEditingController _defController;

  @override
  void initState() {
    super.initState();
    _termController = TextEditingController(
      text: widget.item.vocabulary.term,
    );
    _defController = TextEditingController(
      text: widget.item.vocabulary.definition,
    );
  }

  @override
  void dispose() {
    _termController.dispose();
    _defController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final notifier = ref.read(
      studySetFormStateProvider(widget.setId).notifier,
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.index}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onSelected: (value) {
                    if (value == 'delete') {}
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Xóa thẻ',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              'Thuật ngữ',
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _termController,
              focusNode: widget.item.termFocus,
              onChanged: (val) {},
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Nhập thuật ngữ',
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Ô 2: Định nghĩa
            Text(
              'Định nghĩa',
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _defController,
              focusNode: widget.item.defineFocus,
              onChanged: (val) {},
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Nhập định nghĩa',
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
