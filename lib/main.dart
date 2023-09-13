import 'package:noteit/presentation/bloc/note/note_bloc.dart';
import 'package:noteit/presentation/bloc/note/note_event.dart';
import 'package:noteit/presentation/bloc/note/note_view.dart';
import 'package:noteit/presentation/bloc/notes/notes_bloc.dart';
import 'package:noteit/presentation/bloc/notes/notes_event.dart';
import 'package:noteit/presentation/bloc/notes/notes_view.dart';
import 'package:noteit/presentation/bloc/weather/WeatherBloc.dart';
import 'package:noteit/presentation/pages/WeatherPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>di.locator<NotesBloc>()..add(ShowAllNotes(null))),
        BlocProvider(create: (_)=> di.locator<NoteBloc>()..add(ShowNoteDetailsEvent(null)))
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NotesPage(),
      ),
    );
  }
}

