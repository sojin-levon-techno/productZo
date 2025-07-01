import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machine_task/features/products/models/product_model.dart';
import 'package:machine_task/features/products/repository/product_remote_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_getProductEvent);
    on<EditProductEvent>(_editProductEvent);
  }

  FutureOr<void> _getProductEvent(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    try {
      final result = await ProductRemoteRepository.fetchProductsList();
      emit(ProductSuccess(result: result));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  FutureOr<void> _editProductEvent(
    EditProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    try {
      final result = await ProductRemoteRepository.updateProduct(
        id: event.id,
        title: event.title,
        desc: event.desc,
        price: event.price,
        rating: event.rating,
      );

      emit(ProductEditSuccess(result: result));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
