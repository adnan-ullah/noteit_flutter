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
  Color _selColor = Colors.transparent;
  List<Color> _colors = [
    Color(0xffFFCC70),
    Color(0xffA1CCD1),
    Color(0xffE2F6CA),
    Color(0xffCBFFA9),
    Color(0xffF8E8EE),
    Color(0xffF4E0B9),
  ];

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
                  _note = Note(id: 6, title: _title, description: _desc, color: _selColor);
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
            children: [
              Container(
                  height: 80,
                  margin: EdgeInsets.all(16),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _colors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: (){
                              setState(() {
                                _selColor=_colors[index];
                              });
                            },
                            child: ColorItem(color: _colors[index]));
                      }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 16,);
                  },)),
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
                  children: [
                    Text(
                      "${_desc.length} characters",
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: _selColor,
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

class ColorItem extends StatelessWidget {
  final Color color;

  const ColorItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Colors.black38, width: 5)),
    );
  }
}
