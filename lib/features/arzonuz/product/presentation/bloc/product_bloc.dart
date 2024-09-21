import 'package:arzonuz/features/arzonuz/product/data/model/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/product/data/model/product_model/product_responce.dart';
import 'package:arzonuz/features/arzonuz/data/repositories/product_repository.dart';
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
    on<ProductdeleteProductEvent>(_deleteProduct);
  }
  _deleteProduct(ProductdeleteProductEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.deleteProduct(event.productId);
      if (responce != null) {
        emit(
          ProductDeletedState(),
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
      await productRepository.addToWishlist(event.productId);
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
      final response = await productRepository.getAllProducts();

      if (response.isNotEmpty) {
        emit(ProductGetAllProductsState(products: response));
      } else {
        emit(ProductNoProductsState());
      }
    } catch (e) {
      emit(
        ProductErrorState(message: e.toString()),
      );
    }
  }

  _getMyProducts(ProductGetMyProductsEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      final responce = await productRepository.getMyProducts();
      if ( responce.isNotEmpty) {
        emit(
          ProductGetProductsState(products: responce),
        );
      } else {
        emit(ProductNoProductsState());
      }
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
