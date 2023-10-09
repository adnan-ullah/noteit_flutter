import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:noteit/data/datasources/ObjectBoxStore.dart';
import 'package:noteit/data/model/UserEntity.dart';
import 'package:noteit/presentation/bloc/note/note_bloc.dart';
import 'package:noteit/presentation/bloc/note/note_event.dart';
import 'package:noteit/presentation/bloc/notes/notes_bloc.dart';
import 'package:noteit/presentation/bloc/notes/notes_event.dart';
import 'package:noteit/presentation/bloc/products/product_bloc.dart';
import 'package:noteit/presentation/bloc/products/product_event.dart';
import 'package:noteit/presentation/bloc/products/product_view.dart';
import 'package:noteit/router/screens.dart';
import 'package:noteit/utils/themes.dart';



import 'di/injection.dart' as di;

//late ObjectBox objectbox;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //objectbox = await ObjectBox.create();
  runApp( MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>di.locator<NotesBloc>()..add(ShowAllNotes(null))),
        BlocProvider(create: (_)=> di.locator<NoteBloc>()..add(ShowNoteDetailsEvent(null))),
        BlocProvider(create: (_)=> di.locator<ProductBloc>()..add(ShowAllProducts(null))),
      ],
      child:
      GetMaterialApp(
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        title: 'Flutter Demo',
        theme: kShrineTheme,
      ),
    );
  }
}

