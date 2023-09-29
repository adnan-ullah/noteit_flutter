import 'package:bloc/bloc.dart';
import 'package:noteit/presentation/bloc/products/product_event.dart';
import 'package:noteit/presentation/bloc/products/product_state.dart';

import '../../../domain/usecases/GetAllProductUseCase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase _getAllProductUseCase;

  ProductBloc(this._getAllProductUseCase) : super(ProductError()) {
    on<ShowAllProducts>((event, emit) async {
      emit(ProductLoading());

      final results = await _getAllProductUseCase.execute();
      results.fold(
        (failure) {},
        (data) {
          emit(AllProductsState(data));
        },
      );
    });
  }
}
