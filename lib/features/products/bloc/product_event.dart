part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetProductEvent extends ProductEvent {}

final class EditProductEvent extends ProductEvent {
  final int id;
  final String title;
  final String desc;
  final String rating;
  final String price;

  const EditProductEvent({
    required this.id,
    required this.title,
    required this.desc,
    required this.rating,
    required this.price,
  });
}
