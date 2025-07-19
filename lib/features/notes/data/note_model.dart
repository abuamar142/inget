import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String title,
    required String body,
    required String category,
    required DateTime createdAt,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  factory NoteModel.create({
    required String title,
    required String body,
    required String category,
  }) => NoteModel(
    id: const Uuid().v4(),
    title: title,
    body: body,
    category: category,
    createdAt: DateTime.now(),
  );
}
