import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/bloc/add_to_cart/add_to_cart_event.dart';
import 'package:project1/bloc/add_to_cart/bloc.dart';
import 'package:project1/models/product.dart';

class ListItemCart extends StatelessWidget {
  final Product product;
  final int count;

  ListItemCart({Key key, this.product, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${product.name}',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '$count шт',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${count * product.cost} р',
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              iconSize: 25,
              icon: Icon(Icons.clear),
              onPressed: () {
                BlocProvider.of<AddToCartBloc>(context).add(
                  RemoveProductFromCart(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
