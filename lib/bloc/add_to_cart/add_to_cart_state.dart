import 'package:equatable/equatable.dart';
import 'package:project1/models/product.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class InitialAddToCartState extends AddToCartState {}

class ShowCartWithProducts extends AddToCartState {
  final int totalCost;
  final Map<Product, int> cartPositions;

  ShowCartWithProducts({this.cartPositions, this.totalCost});

  @override
  List<Object> get props => [cartPositions, totalCost];
}
