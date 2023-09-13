import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteit/domain/models/Note.dart';
import 'package:noteit/presentation/bloc/note/note_event.dart';

import 'note_bloc.dart';
import 'note_state.dart';
import 'package:get/get.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Weather',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: BlocProvider(
        create: (context) => NoteBloc()..add(ShowNoteDetailsEvent(Get.arguments)),
        child: Center(
          child: Column(
            children: [
              BlocBuilder<NoteBloc, NoteState>(
                  builder: (context, state) {
                    if (state is NoteEmpty)
                      return CircularProgressIndicator();
                    else if (state is NoteHasData) {
                      return Center(child: Text(state.note.title));
                    } else {
                      return SizedBox();
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

