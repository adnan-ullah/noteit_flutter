import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:noteit/data/datasources/RemoteDataSource.dart';
import 'package:noteit/data/repositories/WeatherRepositoryImpl.dart';
import 'package:noteit/domain/repositories/product_repository.dart';
import 'package:noteit/domain/repositories/weather_repository.dart';
import 'package:noteit/domain/usecases/AddToCartProductUseCase.dart';
import 'package:noteit/domain/usecases/GetAllCartsProductUseCase.dart';
import 'package:noteit/domain/usecases/GetAllProductUseCase.dart';
import 'package:noteit/domain/usecases/GetCurrentWeatherUseCase.dart';
import 'package:noteit/domain/usecases/GetFiltersProductUseCase.dart';
import 'package:noteit/presentation/bloc/note/note_bloc.dart';
import 'package:noteit/presentation/bloc/notes/notes_bloc.dart';
import 'package:noteit/presentation/bloc/products/product_bloc.dart';
import 'package:noteit/presentation/bloc/weather/WeatherBloc.dart';


import 'data/repositories/ProductRepositoryImpl.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator(),locator(),locator(),locator()));
  locator.registerFactory(() => NoteBloc());
  locator.registerFactory(() => NotesBloc(locator()));

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<ProductRepository>(
          () => ProductRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));
  locator.registerLazySingleton(() => GetAllProductUseCase(locator()));
  locator.registerLazySingleton(() => GetFiltersProductUseCase(locator()));
  locator.registerLazySingleton(() => AddToCartProductUseCase(locator()));
  locator.registerLazySingleton(() => GetAllCartProductUseCase(locator()));
}
