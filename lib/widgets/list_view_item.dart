import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:project1/bloc/add_to_cart/add_to_cart_event.dart';
import 'package:project1/models/product.dart';
import 'package:project1/widgets/my_dialog.dart';

class ListViewItem extends StatelessWidget {
  final Product product;

  ListViewItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            imageBuilder: (context, imageProvider) {
              return InkWell(
                onTap: () async {
                  await showDialog(
                    context: context,
                    // barrierDismissible: false,
                    builder: (context) {
                      return MyDialog(
                        product: product,
                      );
                    },
                  );
                },
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<AddToCartBloc>(context).add(
                    AddProductToCart(product),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
