import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project1/models/product.dart';
import './bloc.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  @override
  AddToCartState get initialState => InitialAddToCartState();

  Map<Product, int> cartPositions = {};

  Stream<AddToCartState> mapEventToState(
    AddToCartEvent event,
  ) async* {
    if (event is AddProductToCart) {
      yield* _mapAddProductToState(event);
    }
    if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductToState(event);
    }
  }

  Stream<AddToCartState> _mapAddProductToState(AddProductToCart event) async* {
    Product currProduct = event.product;
    if (cartPositions.containsKey(currProduct)) {
      cartPositions.update(currProduct, (value) => value + 1);
    } else {
      cartPositions[currProduct] = 1;
    }
    int totalCost = 0;
    cartPositions.forEach((key, value) => totalCost += key.cost * value);
    yield ShowCartWithProducts(
      totalCost: totalCost,
      cartPositions: cartPositions,
    );
  }

  Stream<AddToCartState> _mapRemoveProductToState(RemoveProductFromCart event) async* {
    Product currProduct = event.product;
    cartPositions.remove(currProduct);
    if (cartPositions.length == 0) {
      yield InitialAddToCartState();
    } else {
      int totalCost = 0;
      cartPositions.forEach((key, value) => totalCost += key.cost * value);
      yield ShowCartWithProducts(
        totalCost: totalCost,
        cartPositions: cartPositions,
      );
    }
  }
}
