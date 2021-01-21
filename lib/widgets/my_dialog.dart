import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/bloc/add_to_cart/bloc.dart';
import 'package:project1/models/product.dart';

class MyDialog extends StatelessWidget {
  final Product product;

  MyDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.description,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Цена: ${product.cost} р.'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: RaisedButton(
              onPressed: (){
                BlocProvider.of<AddToCartBloc>(context).add(
                  AddProductToCart(product),
                );
              },
              color: Colors.brown[200],
              child: Text('В корзину'),
            ),
          ),
        ],
      ),
    );
  }
}
