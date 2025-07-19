import '../../data/note_model.dart';

abstract class NoteRepository {
  Future<List<NoteModel>> getNotes();
  Future<void> createNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
}
