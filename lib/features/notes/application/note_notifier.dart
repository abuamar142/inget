import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/note_model.dart';
import '../domain/repositories/note_repository.dart';

class NoteNotifier extends StateNotifier<List<NoteModel>> {
  final NoteRepository _repository;

  NoteNotifier({required NoteRepository repository})
    : _repository = repository,
      super(<NoteModel>[]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final List<NoteModel> notes = await _repository.getNotes();
    state = notes;
  }

  Future<void> create(NoteModel newNote) async {
    await _repository.createNote(newNote);
    await loadNotes();
  }

  Future<void> update(NoteModel updatedNote) async {
    await _repository.updateNote(updatedNote);
    await loadNotes();
  }

  Future<void> delete(String id) async {
    await _repository.deleteNote(id);
    await loadNotes();
  }
}
