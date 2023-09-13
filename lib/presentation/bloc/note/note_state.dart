import 'package:equatable/equatable.dart';

import '../../../domain/models/Note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteEmpty extends NoteState{}
class NoteError extends NoteState{}
class NoteLoading extends NoteState{}


class InsertNoteState extends NoteState{
  final Note note;

  const InsertNoteState(this.note);

  @override
  List<Object?> get props => [note];

}

class NoteHasData extends NoteState{
  final Note note;

  const NoteHasData(this.note);

  @override
  List<Object?> get props => [note];

}
