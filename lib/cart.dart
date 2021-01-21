import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:project1/bloc/add_to_cart/add_to_cart_state.dart';
import 'package:project1/home_screen.dart';
import 'package:project1/menu.dart';
import 'package:project1/profile_screen.dart';

import 'models/product.dart';
import 'widgets/list_view_item_cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddToCartBloc, AddToCartState>(
        builder: (context, state) {
          if (state is InitialAddToCartState) {
            return Center(
              child: Text('Корзина пуста'),
            );
          }
          if (state is ShowCartWithProducts) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartPositions.length,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      List<Product> products =
                          state.cartPositions.keys.toList();
                      List<int> counts = state.cartPositions.values.toList();
                      return ListItemCart(
                        product: products[index],
                        count: counts[index],
                      );
                    },
                  ),
                ),
                Text('Итого: ${state.totalCost} р.'),
                RaisedButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 10,),
                  color: Colors.brown[200],
                  child: Text('Оформить заказ'),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Корзина'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/shtefan.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Главная',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.brown[900],
                ),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Меню',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.brown[900],
                ),
              ),
              leading: Icon(Icons.restaurant_menu),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'О себе',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.brown[900],
                ),
              ),
              leading: Icon(Icons.account_box),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
