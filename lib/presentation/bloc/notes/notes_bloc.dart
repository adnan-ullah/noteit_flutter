import 'package:bloc/bloc.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:noteit/presentation/bloc/note/note_event.dart';

import '../../../domain/models/Note.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final List<Note> allNotes = [
     Note(id: 1, title: "Baazar", description: "Its awesome day for baazar"),
     Note(id: 2, title: "Office", description: "Its awesome day for office"),
  ];

  NotesBloc() : super(NotesEmpty()) {

    on<ShowAllNotes>((event, emit) async {
      emit(NotesLoading());
      emit(AllNotesState(allNotes));
    });

    on<FilterAllNotes>((event, emit) async {
      emit(NotesLoading());
      emit(FilterNotes(filteringNotes(event.filterQuery)));
    });

    on<InsertNoteEvent>((event, emit)async {
      emit(NotesLoading());
      allNotes.add(event.note);
      emit(AllNotesState(allNotes));
    });

    on<DeleteNoteEvent>((event, emit)async {
      emit(NotesLoading());
      allNotes.remove(event.note);
      emit(AllNotesState(allNotes));
    });

  }

  List<Note> filteringNotes(String query) {
    List<Note> updateList = [];
    for (var each in allNotes) {
      if (each.title.startsWith(query)) {
        updateList.add(each);
      }
    }
    return updateList;
  }
}


