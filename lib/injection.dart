import 'package:noteit/data/datasources/RemoteDataSource.dart';
import 'package:noteit/data/repositories/WeatherRepositoryImpl.dart';
import 'package:noteit/domain/repositories/weather_repository.dart';
import 'package:noteit/domain/usecases/GetCurrentWeatherUseCase.dart';
import 'package:noteit/presentation/bloc/note/note_bloc.dart';
import 'package:noteit/presentation/bloc/notes/notes_bloc.dart';
import 'package:noteit/presentation/bloc/weather/WeatherBloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => NoteBloc());
  locator.registerFactory(() => NotesBloc());
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
}
