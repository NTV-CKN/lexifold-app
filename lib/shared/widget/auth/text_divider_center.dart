import 'package:flutter/material.dart';

class TextDividerCenter extends StatelessWidget {
  final String text;

  const TextDividerCenter(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ],
    );
  }
}
