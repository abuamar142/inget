import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/service_locator.dart';
import '../data/note_model.dart';
import '../data/repositories/note_local_repository.dart';
import '../domain/repositories/note_repository.dart';
import 'note_notifier.dart';

final Provider<NoteRepository> noteRepositoryProvider =
    Provider<NoteRepository>((Ref<NoteRepository> ref) {
      final SharedPreferences prefs = ref.watch(sharedPreferencesProvider);
      return NoteLocalRepository(prefs);
    });

final StateNotifierProvider<NoteNotifier, List<NoteModel>>
noteNotifierProvider = StateNotifierProvider<NoteNotifier, List<NoteModel>>((
  Ref ref,
) {
  final NoteRepository repository = ref.watch(noteRepositoryProvider);
  return NoteNotifier(repository: repository);
});
