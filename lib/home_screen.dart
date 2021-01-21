import 'package:flutter/material.dart';
import 'package:project1/build_list_view_horizontal.dart';
import 'package:project1/cart.dart';
import 'package:project1/firebase/firestore_provider.dart';
import 'package:project1/menu.dart';
import 'package:project1/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirestoreProvider database = FirestoreProvider();

  final String new1 = 'Новинки';
  final String pop2 = 'Популярное';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        centerTitle: true,
        title: Text(
          'Главная',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 19,
            color: Colors.brown[100],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // вынеси дравер в отдельный виджет, а то у тебя код дублируется нахера то!!!
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
                  MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  MaterialPageRoute(builder: (context) => MenuScreen()),
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
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: database.getType('Новинка'), 
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListViewProductsHorizontal(  
                  leftheader1: new1,
                  snapshot: snapshot,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          StreamBuilder(
            stream: database.getType('Популярное'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListViewProductsHorizontal(
                  leftheader1: pop2,
                  snapshot: snapshot,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
