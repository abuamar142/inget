import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../widgets/note_form.dart';

class NoteDialogs {
  const NoteDialogs._();

  /// Show create note dialog
  static Future<bool?> showCreateDialog({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController bodyController,
    required VoidCallback onSave,
    required VoidCallback onClear,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(AppStrings.titleNoteCreate),
        content: SingleChildScrollView(
          child: NoteForm(
            formKey: formKey,
            titleController: titleController,
            bodyController: bodyController,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: onClear,
            child: const Text(AppStrings.buttonClear),
          ),
          ElevatedButton(
            onPressed: onSave,
            child: const Text(AppStrings.buttonCreate),
          ),
        ],
      ),
    );
  }

  /// Show edit note dialog
  static Future<bool?> showEditDialog({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController bodyController,
    required VoidCallback onSave,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(AppStrings.titleNoteEdit),
        content: SingleChildScrollView(
          child: NoteForm(
            formKey: formKey,
            titleController: titleController,
            bodyController: bodyController,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text(AppStrings.buttonCancel),
          ),
          ElevatedButton(
            onPressed: onSave,
            child: const Text(AppStrings.buttonSave),
          ),
        ],
      ),
    );
  }

  /// Show delete confirmation dialog
  static Future<bool?> showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(AppStrings.titleNoteDelete),
        content: const Text(AppStrings.messageNoteDelete),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(AppStrings.buttonCancel),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text(AppStrings.buttonDelete),
          ),
        ],
      ),
    );
  }
}
