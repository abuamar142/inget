import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../application/providers.dart';
import '../../data/note_model.dart';
import '../dialogs/note_dialogs.dart';

class NoteCard extends HookConsumerWidget {
  final NoteModel note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    final TextEditingController titleController = useTextEditingController();
    final TextEditingController bodyController = useTextEditingController();

    // Set initial text when showing edit dialog
    useEffect(() {
      titleController.text = note.title;
      bodyController.text = note.body;
      return null;
    }, <Object?>[note]);

    void handleDelete() {
      NoteDialogs.showDeleteDialog(context).then((bool? confirmed) {
        if (confirmed ?? false) {
          try {
            ref.read(noteNotifierProvider.notifier).delete(note.id);
            if (context.mounted) {
              context.showSuccessSnackBar(AppStrings.snackbarNoteDeleted);
            }
          } catch (e) {
            if (context.mounted) {
              context.showErrorSnackBar(AppStrings.snackbarNoteError);
            }
          }
        }
      });
    }

    void handleCopyToClipboard() {
      Clipboard.setData(ClipboardData(text: note.body));
      context.showSuccessSnackBar('${AppStrings.copyPrefix}${note.body}');
    }

    void handleUpdate() {
      final String title = titleController.text;
      final String body = bodyController.text;

      if (title.isEmpty || body.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(AppStrings.noteFormsRequired)),
        );
        return;
      }

      final NoteModel updated = note.copyWith(title: title, body: body);

      try {
        ref.read(noteNotifierProvider.notifier).update(updated);
        context.pop();
        context.showSuccessSnackBar(AppStrings.snackbarNoteUpdated);
      } catch (e) {
        context.showErrorSnackBar(AppStrings.snackbarNoteError);
      }
    }

    void showActionsBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text(AppStrings.buttonEdit),
                onTap: () {
                  context.pop();

                  NoteDialogs.showEditDialog(
                    context: context,
                    formKey: formKey,
                    titleController: titleController,
                    bodyController: bodyController,
                    onSave: handleUpdate,
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: const Text(AppStrings.buttonDelete),
                onTap: () {
                  context.pop();

                  handleDelete();
                },
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: handleCopyToClipboard,
        onLongPress: showActionsBottomSheet,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(note.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(note.body, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
