import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteit/presentation/bloc/note/note_view.dart';

import '../../../domain/models/Note.dart';
import 'notes_bloc.dart';
import 'notes_event.dart';
import 'notes_state.dart';
import 'package:get/get.dart';
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
          hintText: 'Enter city name',
        ),
        onChanged: (query) {

        },
      ),

          BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                if (state is NotesEmpty) {
                  return Container();
                }
                else if (state is NotesLoading) {
                  return CircularProgressIndicator();
                }
                else if (state is FilterNotes)
                  {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.filterNotes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: const Icon(Icons.list),
                                trailing: Text(
                                  state.filterNotes[index].title,
                                  style: TextStyle(color: Colors.green, fontSize: 15),
                                ),
                                title: Text(state.filterNotes[index].title,));
                          }),
                    );
                  }
                else if (state is AllNotesState) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.allNotes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Get.to(NotePage(), arguments:state.allNotes[index]);
                            },
                            child: ListTile(
                                leading: const Icon(Icons.list),
                                trailing: Text(
                                  state.allNotes[index].title,
                                  style: TextStyle(color: Colors.green, fontSize: 15),
                                ),
                                title: Text(state.allNotes[index].title,)),
                          );
                        }),
                  );
                }
                else
                  return SizedBox();
              }

          ),

          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child:   FloatingActionButton(
                  onPressed: () {
                    context.read<NotesBloc>().add(const DeleteNoteEvent(Note(id: 3,title: "Watch", description: "All is well")));
                  },
                  foregroundColor:Colors.white,
                  backgroundColor: Colors.black54,
                  child: const Icon(Icons.delete),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child:   FloatingActionButton(
                  onPressed: () {
                    context.read<NotesBloc>().add(const InsertNoteEvent(Note(id: 3,title: "Watch", description: "All is well")));

                  },
                  foregroundColor:Colors.white,
                  backgroundColor: Colors.black54,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    ),



    );
  }
}
