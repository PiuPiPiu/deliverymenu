import 'package:equatable/equatable.dart';
import 'package:project1/models/product.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends AddToCartEvent {
  final Product product;

  AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCart extends AddToCartEvent {
  final Product product;

  RemoveProductFromCart(this.product);

  @override
  List<Object> get props => [product];
}