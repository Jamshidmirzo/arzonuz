import 'package:arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/data/models/product_model/product_responce.dart';
import 'package:arzonuz/logic/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository = ProductRepository();
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<ProductAddEvent>(_addProduct);
    on<ProductGetMyProductsEvent>(_getMyProducts);
    on<ProductGetAllProductsEvent>(_getProducts);
    on<ProductAddtoWishlistEvent>(_addToWishlist);
    on<ProductGetWishlistProductsEvent>(_getWishlist);
    on<ProductAddtoSharedWishlistEvent>(_addToShared);
  }
  _addToShared(ProductAddtoSharedWishlistEvent event, emit) {}
  _getWishlist(ProductGetWishlistProductsEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.getWishlist();
      if (responce != null) {
        emit(
          ProductGetWishlistProductsState(products: responce),
        );
      } else {
        emit(ProductInitial());
      }
    } catch (e) {
      emit(
        ProductErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _addToWishlist(ProductAddtoWishlistEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.addToWishlist(event.productId);
      // emit(
      //   ProductGetWishlistProductsState(products: responce!),
      // );
    } catch (e) {
      emit(
        ProductErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _getProducts(ProductGetAllProductsEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.getAllProducts();

      emit(
        ProductGetAllProductsState(products: responce!),
      );
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  _getMyProducts(ProductGetMyProductsEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.getMyProducts();

      emit(
        ProductGetProductsState(products: responce!),
      );
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  _addProduct(ProductAddEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      await productRepository.createProduct(event.productResponce);
      emit(ProductAddedState());
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }
}
