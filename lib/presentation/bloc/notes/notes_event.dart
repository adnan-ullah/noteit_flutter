import 'package:equatable/equatable.dart';
import 'package:noteit/domain/models/Note.dart';

abstract class NotesEvent extends Equatable{

  const NotesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class InitEvent extends NotesEvent {}
class ShowAllNotes extends NotesEvent {
   List<Note>? allNotes = null;

   ShowAllNotes(this.allNotes);

  @override
  List<Object?> get props => [allNotes];
}

class FilterAllNotes extends NotesEvent {
  String filterQuery;

  FilterAllNotes(this.filterQuery);

  @override
  List<Object?> get props => [filterQuery];

}

class InsertNoteEvent extends NotesEvent {
  final Note note;

  const InsertNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}
class DeleteNoteEvent extends NotesEvent {
  final Note note;

  const DeleteNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}


