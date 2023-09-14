import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:noteit/domain/models/Note.dart';
import 'package:noteit/presentation/bloc/notes/notes_bloc.dart';
import 'package:noteit/presentation/bloc/notes/notes_event.dart';

class InsertNotePage extends StatefulWidget {
  const InsertNotePage({super.key});

  @override
  State<InsertNotePage> createState() => _InsertNotePageState();
}

class _InsertNotePageState extends State<InsertNotePage> {
  late Note _note;
  late String _title;
  String _desc = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Add Note',
            style: TextStyle(color: Colors.orange),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _note = Note(id: 6, title: _title, description: _desc);
                  context.read<NotesBloc>()..add(InsertNoteEvent(_note));
                  Get.back();
                },
                icon: Icon(Icons.check))
          ],
        ),
        body: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (q) {
                    _title = q;
                  },
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [Text("${_desc.length} characters",style: TextStyle(color: Colors.black38),)],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: TextField(
                    onChanged: (q) {
                      setState(() {
                        _desc = q;
                      });

                    },
                    decoration: InputDecoration(
                        hintText: 'Start typings',
                        hintStyle: TextStyle(color: Colors.grey)),
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
