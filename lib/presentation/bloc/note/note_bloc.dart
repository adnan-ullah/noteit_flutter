import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteEmpty()) {

    on<ShowNoteDetailsEvent>(
        (event, emit) async {
          final note = event.note;
          emit(NoteHasData(note!));
        }
    );

  }
  // EventTransformer<T> debounce<T>(Duration duration) {
  //   return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  // }
}
