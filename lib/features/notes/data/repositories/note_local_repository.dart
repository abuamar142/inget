import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/storage/storage_keys.dart';
import '../../domain/repositories/note_repository.dart';
import '../note_model.dart';

class NoteLocalRepository implements NoteRepository {
  final SharedPreferences _prefs;

  NoteLocalRepository(this._prefs);

  @override
  Future<List<NoteModel>> getNotes() async {
    final String? notesJson = _prefs.getString(StorageKeys.notes);
    if (notesJson == null) return <NoteModel>[];

    final List<dynamic> notesList = json.decode(notesJson);
    return notesList.map((dynamic json) => NoteModel.fromJson(json)).toList();
  }

  @override
  Future<void> createNote(NoteModel note) async {
    final List<NoteModel> notes = await getNotes();
    notes.add(note);
    await _saveNotes(notes);
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    final List<NoteModel> notes = await getNotes();
    final int index = notes.indexWhere((NoteModel n) => n.id == note.id);
    if (index != -1) {
      notes[index] = note;
      await _saveNotes(notes);
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    final List<NoteModel> notes = await getNotes();
    notes.removeWhere((NoteModel note) => note.id == id);
    await _saveNotes(notes);
  }

  Future<void> _saveNotes(List<NoteModel> notes) async {
    final String notesJson = json.encode(
      notes.map((NoteModel note) => note.toJson()).toList(),
    );
    await _prefs.setString(StorageKeys.notes, notesJson);
  }
}
