import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String imageUrl;
  String name;
  String description;
  int cost;

  Product({this.id, this.cost, this.imageUrl, this.name, this.description});

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data['id'];
    imageUrl = snapshot.data['imageUrl'];
    name = snapshot.data['name'];
    description = snapshot.data['description'];
    cost = snapshot.data['cost'];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl &&
          name == other.name &&
          description == other.description &&
          cost == other.cost;

  @override
  int get hashCode =>
      id.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      description.hashCode ^
      cost.hashCode;

  @override
  String toString() => 'Product{name: $name, cost: $cost}';
}
