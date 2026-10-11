import 'package:lexifold/data/source/local/lexi_fold_database.dart';

sealed class GroupedRowItem {}

class HeaderRowItem extends GroupedRowItem {
  final DateTime monthYear;

  HeaderRowItem(this.monthYear);
}

class DataRowItem extends GroupedRowItem {
  final StudySet studySet;

  DataRowItem(this.studySet);
}

class GroupedStudySet {
  final DateTime datetime;
  final List<StudySet> items;

  const GroupedStudySet({
    required this.datetime,
    required this.items,
  });
}

extension StudySetGroupingExt on List<StudySet> {
  ///Thực hiện chuyển đổi danh sách các StudySet thành dạng
  ///List<GroupedStudySet> type - Chứa thời gian và các items cùng thời gian
  ///tương ứng, sử dụng cho việc gom nhóm các studyset...
  List<GroupedStudySet> mapToGroupedStudySet() {
    final Map<DateTime, List<StudySet>> map = {};

    for (StudySet item in this) {
      final key = DateTime(item.createdAt.year, item.createdAt.month);
      map.putIfAbsent(key, () => []).add(item);
    }

    return map.entries
        .map(
          (entry) => GroupedStudySet(
            datetime: entry.key,
            items: entry.value,
          ),
        )
        .toList();
  }

  ///Thực hiện trải thẳng danh sách GroupedStudySet,
  ///giúp UI render mượt mà hơn.
  List<GroupedRowItem> flatGroupedStudySet() {
    final List<GroupedRowItem> result = [];

    final groupedStudySets = mapToGroupedStudySet();
    if (groupedStudySets.isEmpty) return result;

    for (GroupedStudySet group in groupedStudySets) {
      result.add(HeaderRowItem(group.datetime));
      result.addAll(group.items.map((item) => DataRowItem(item)));
    }

    return result;
  }
}
