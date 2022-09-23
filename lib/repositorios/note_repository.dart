import 'package:hive/hive.dart';
import 'dart:async';
import '../models/note_model.dart';

class NoteRepository {
  NoteRepository() : _noteBox = Hive.box('Note');
  final Box<Note> _noteBox;

  // gerar nota completa
  Future<List<Note>> getFullNote() async => _noteBox.values.toList();

  // colocar nota na box
  Future<void> addToBox(Note note) async => await _noteBox.add(note);

  // deletar nota
  Future<void> removeFromBox(int index) async => await _noteBox.deleteAt(index);

  // deletar todos os dados
  Future<void> deleteAll() async => await _noteBox.clear();

  // atualizar
  Future<void> updateNote(int index, Note note) async =>
      await _noteBox.putAt(index, note);
}
