import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetContent extends ConsumerStatefulWidget {
  const SetContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SetContent();
  }
}

class _SetContent extends ConsumerState<SetContent>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) =>
          ListTile(title: Text('Học phần $index')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
