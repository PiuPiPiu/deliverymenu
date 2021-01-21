import 'package:flutter/material.dart';
import 'package:project1/cart.dart';
import 'package:project1/datastore/shared_prefs.dart';
import 'package:project1/home_screen.dart';
import 'package:project1/menu.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SharedPrefs.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: <Widget>[
                TextFormField(
                  initialValue: snapshot.data[0],
                  decoration: InputDecoration(labelText: 'Имя'),
                ),
                TextFormField(
                  initialValue: snapshot.data[1],
                  decoration: InputDecoration(labelText: 'Телефон'),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: Colors.brown[150],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        centerTitle: true,
        title: Text(
          'О себе',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen())),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/shtefan.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Главная',
                style: TextStyle(
                  fontSize: 17,
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
    );
  }
}
