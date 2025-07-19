import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../application/providers.dart';
import '../../data/note_model.dart';
import '../dialogs/note_dialogs.dart';
import '../widgets/note_card.dart';

class NotesScreen extends HookConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    final TextEditingController titleController = useTextEditingController();
    final TextEditingController bodyController = useTextEditingController();
    final List<NoteModel> notes = ref.watch(noteNotifierProvider);

    void clearForm() {
      titleController.clear();
      bodyController.clear();
    }

    void handleCreate() {
      final String title = titleController.text;
      final String body = bodyController.text;

      if (title.isEmpty || body.isEmpty) {
        context.showErrorSnackBar(AppStrings.noteFormsRequired);
        return;
      }

      final NoteModel newNote = NoteModel.create(
        title: title,
        body: body,
        category: AppStrings.categoryGeneral,
      );

      try {
        ref.read(noteNotifierProvider.notifier).create(newNote);
        clearForm();
        context.pop();
        context.showSuccessSnackBar(AppStrings.snackbarNoteCreated);
      } catch (e) {
        context.showErrorSnackBar(AppStrings.snackbarNoteError);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => NoteDialogs.showCreateDialog(
          context: context,
          formKey: formKey,
          titleController: titleController,
          bodyController: bodyController,
          onClear: clearForm,
          onSave: handleCreate,
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Inget'), centerTitle: true),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.note_add_outlined, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.noteEmpty,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.noteEmptySubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              physics: const BouncingScrollPhysics(),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteCard(note: notes[index]);
              },
            ),
    );
  }
}
