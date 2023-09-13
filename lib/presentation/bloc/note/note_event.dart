import 'package:equatable/equatable.dart';

import '../../../domain/models/Note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

class ShowNoteDetailsEvent extends NoteEvent {
   Note? note = null;

   ShowNoteDetailsEvent(this.note);

  @override
  List<Object?> get props => [note];
}


