import 'package:equatable/equatable.dart';

import '../../../domain/models/Note.dart';

abstract class NotesState extends Equatable{
  const NotesState();

  @override
  List<Object?> get props => [];
}
class NotesEmpty extends NotesState{}
class NotesLoading extends NotesState{}
class NotesError extends NotesState{}

class FilterNotes extends NotesState{
  final List<Note> filterNotes;
  FilterNotes(this.filterNotes);

  @override
  // TODO: implement props
  List<Object?> get props => [filterNotes];
}

class AllNotesState extends NotesState{
   List<Note> allNotes;
   AllNotesState(this.allNotes);

  @override
  List<Object?> get props => [allNotes];
}



class InsertNoteState extends NotesState{
  final Note note;

  const InsertNoteState(this.note);

  @override
  List<Object?> get props => [note];

}

