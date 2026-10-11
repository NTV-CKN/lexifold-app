import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/data/enums/paging_metadata.dart';
import 'package:lexifold/shared/widget/paging_study_set/paging_study_set.dart';

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

    return PagingStudySet(StudySetPagingEnum.ALL_STUDY_SET);
  }

  @override
  bool get wantKeepAlive => true;
}
