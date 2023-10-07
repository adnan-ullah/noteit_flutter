import 'package:bloc/bloc.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/presentation/bloc/products/product_event.dart';
import 'package:noteit/presentation/bloc/products/product_state.dart';

import '../../../domain/usecases/GetAllProductUseCase.dart';
import '../../../domain/usecases/GetFiltersProductUseCase.dart';
import '../../../domain/usecases/AddToCartProductUseCase.dart';
import '../../../domain/usecases/GetAllCartsProductUseCase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase _getAllProductUseCase;
  final GetFiltersProductUseCase _getFiltersProductUseCase;
  final AddToCartProductUseCase _addToCartProductUseCase;
  final GetAllCartProductUseCase _allCartProductUseCase;

  ProductBloc(this._getAllProductUseCase, this._getFiltersProductUseCase,
      this._addToCartProductUseCase, this._allCartProductUseCase)
      : super(ProductError()) {
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

    on<ShowFiltersProducts>((event, emit) async {
      emit(ProductLoading());

      final results = await _getFiltersProductUseCase.execute(event.filterText);
      results.fold(
        (failure) {},
        (data) {
          emit(AllProductsState(data));
        },
      );
    });

    on<AddToCart>((event, emit) async {
      _addToCartProductUseCase.execute(event.cartProduct);
      final allCartProducts = await _allCartProductUseCase.execute();

      allCartProducts.fold(
          (failure) => {}, (data) => {emit(AllCartProductsState(data))});
    });
  }
}
