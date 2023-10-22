
import 'package:get_it/get_it.dart';

import '../presentation/bloc/note/note_bloc.dart';
import '../presentation/bloc/notes/notes_bloc.dart';
import '../presentation/bloc/products/product_bloc.dart';
import '../presentation/bloc/weather/WeatherBloc.dart';

final locatorBloc = GetIt.instance;

void initBlocs() {
  locatorBloc.registerFactory(() => WeatherBloc(locatorBloc()));
  locatorBloc.registerFactory(() => ProductBloc(locatorBloc(),locatorBloc(),locatorBloc(),locatorBloc()));
  locatorBloc.registerFactory(() => NoteBloc());
  locatorBloc.registerFactory(() => NotesBloc(locatorBloc()));
}

