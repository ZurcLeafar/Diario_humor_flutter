import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/app.dart';
import '/models/draw_line.dart';
import '/models/note_model.dart';
import 'repositorios/file_repository.dart';
import 'repositorios/note_repository.dart';

Future<void> main() async {
  {
    await Hive.initFlutter();
    Hive.registerAdapter<Note>(NoteAdapter());
    Hive.registerAdapter<ImageContent>(ImageContentAdapter());
    Hive.registerAdapter<ImageType>(ImageTypeAdapter());
    Hive.registerAdapter<DrawLine>(DrawLineAdapter());
    Hive.registerAdapter<Offset>(OffsetAdapter());
    await Hive.openBox<Note>('Note');
    runApp(App(
      noteRepository: NoteRepository(),
      fileRepository: FileRepository(),
    ));
  }
}
