import 'package:flutter/material.dart';
import 'package:project1/menu.dart';
import 'package:project1/models/product.dart';
import 'package:project1/widgets/list_view_item_horizontal.dart';

class ListViewProductsHorizontal extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final String leftheader1;

  ListViewProductsHorizontal({this.snapshot, this.leftheader1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                leftheader1,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700],
                ),
              ),
              GestureDetector(
                child: Text(
                  'См. меню',
                  style: TextStyle(
                    color: Colors.brown[900],
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, i) {
              Product product =
                  Product.fromSnapshot(snapshot.data.documents[i]);
              return ListViewItemHorizontal(
                product: product,
              );
            },
          ),
        ),
      ],
    );
  }
}
