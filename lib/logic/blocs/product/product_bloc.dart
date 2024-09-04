import 'package:arzonuz/data/models/product_responce.dart';
import 'package:arzonuz/logic/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';


part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository = ProductRepository();
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<ProductAddEvent>(_addProduct);
  }
  _addProduct(ProductAddEvent event, emit) async {
    emit(ProductLoadingState());
    try {
      await productRepository.createProduct(event.productResponce);
    } catch (e) {
      rethrow;
    }
  }
}
