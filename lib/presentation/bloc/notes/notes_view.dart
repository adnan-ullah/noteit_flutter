import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:noteit/presentation/bloc/note/note_view.dart';
import 'package:noteit/presentation/pages/InsertNotePage.dart';

import '../../../domain/models/Note.dart';
import 'notes_bloc.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notes',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter notes name',
              ),
              onChanged: (query) {
                context.read<NotesBloc>()..add(FilterAllNotes(query));
              },
            ),
            BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
              if (state is NotesEmpty) {
                return Container();
              } else if (state is NotesLoading) {
                return CircularProgressIndicator();
              } else if (state is FilterNotes) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.filterNotes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: const Icon(Icons.list),
                            trailing: Text(
                              state.filterNotes[index].title,
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            title: Text(
                              state.filterNotes[index].title,
                            ));
                      }),
                );
              } else if (state is AllNotesState) {
                return Expanded(
                    child: MasonryGridView.count(
                      padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  itemCount: state.allNotes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(NotePage(),arguments: state.allNotes[index]);
                      },
                      child: CardNoteItem(
                        note: state.allNotes[index],
                      ),
                    );
                  },
                ));
              } else
                return SizedBox();
            }),
            Container(
              margin: EdgeInsets.all(16),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {
                        context.read<NotesBloc>().add(DeleteNoteEvent(Note(
                            id: 3, title: "Watch", description: "All is well")));
                      },
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black54,
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.to(InsertNotePage());
                      },
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black54,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardNoteItem extends StatelessWidget {
  final Note note;

  const CardNoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      color: note.color,
      margin: EdgeInsets.all(16),
      child: Container(
          width: 500,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${note.title}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${note.description}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )),
    );
  }
}
