part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});
}

final class ProductSuccess extends ProductState {
  final ProductModel result;

  const ProductSuccess({required this.result});
}

final class ProductEditSuccess extends ProductState {
  final bool result;

  const ProductEditSuccess({required this.result});
}
