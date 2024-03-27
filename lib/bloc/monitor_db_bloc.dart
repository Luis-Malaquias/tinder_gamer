/*import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_collection.dart';
import '../provider/firestore_firebase.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc()
      : super(MonitorState(
          noteCollection: NoteCollection(),
        )) {
    //LocalDatabase.helper.stream.listen((event) {
    //RestDataProvider.helper.stream.listen((event) {
    FirestoreDatabase.helper.stream.listen((event) {
      /*
      String noteId = event[0];
      if (event[1] == null) {
        noteCollection.deleteNoteOfId(noteId);
      } else {
        noteCollection.updateOrInsertNoteOfId(noteId, event[1]);
      }*/
      noteCollection = event;

      add(UpdateList());
    });
    on<UpdateList>((event, Emitter emit) {
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<AskNewList>((event, Emitter emit) async {
      noteCollection = await RealtimeDatabaseProvider.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    add(AskNewList());
  }
}

abstract class MonitorEvent {}

class UpdateList extends MonitorEvent {}

class AskNewList extends MonitorEvent {}

class MonitorState {
  NoteCollection noteCollection;
  MonitorState({required this.noteCollection});
}*/
