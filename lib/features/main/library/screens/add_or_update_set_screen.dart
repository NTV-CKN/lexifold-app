import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/features/main/library/screens/add_or_update_set_provider.dart';
import 'package:lexifold/utils/show_progress_dialog.dart';

import '../../../../l10n/app_localizations.dart';

class AddOrUpdateSetScreen extends ConsumerStatefulWidget {
  static String KEY_IS_UPDATE = "AddOrUpdateSetScreen.KEY_IS_UPDATE";
  static String KEY_ID_SET = "AddOrUpdateSetScreen.KEY_ID_SET";

  const AddOrUpdateSetScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddOrUpdateSetState();
  }
}

class _AddOrUpdateSetState
    extends ConsumerState<AddOrUpdateSetScreen> {
  late ScrollController _scrollController;

  IconData getIconByVisibility(bool isPublic) {
    return isPublic ? Icons.public : Icons.public_off;
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>;
    final bool isUpdate = args[AddOrUpdateSetScreen.KEY_IS_UPDATE];
    final String? idSet = args[AddOrUpdateSetScreen.KEY_ID_SET];

    //watch
    final studySetForm = ref.watch(studySetFormStateProvider(idSet));

    return studySetForm.when(
      data: (formData) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.clear),
            ),
            title: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formData.studySetData.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          getIconByVisibility(
                            formData.studySetData.isPublic,
                          ),
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          formData.studySetData.isPublic
                              ? l10n.textPublic
                              : l10n.textPrivate,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined),
              ),
            ],
          ),

          body: ,
        );
      },
      error: (err, stack) =>
          Center(child: Text(l10n.textErrorDuringProgress)),
      loading: () => ShowProgressDialog.dialogLoadingWidget(context),
    );
  }
}
