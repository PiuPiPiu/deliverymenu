import 'package:flutter/material.dart';
import 'package:project1/models/product.dart';
import 'package:project1/widgets/list_view_item.dart';

class ListViewProducts extends StatelessWidget {
  final AsyncSnapshot snapshot;

  ListViewProducts({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      itemBuilder: (context, i) {
        Product product = Product.fromSnapshot(snapshot.data.documents[i]);
        return ListViewItem(
          product: product,
        );
      },
    );
  }
}
