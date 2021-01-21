import 'package:flutter/material.dart';
import 'package:project1/build_list_view.dart';
import 'package:project1/cart.dart';
import 'package:project1/firebase/firestore_provider.dart';
import 'package:project1/home_screen.dart';
import 'package:project1/profile_screen.dart';

class MenuScreen extends StatelessWidget {
  final FirestoreProvider database = FirestoreProvider();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        //Верхняя панель навигации
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          centerTitle: true,
          title: Text(
            'Меню',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 19,
              color: Colors.brown[100],
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.brown[100],
            labelStyle: TextStyle(
              fontSize: 17,
            ),
            tabs: [
              Tab(
                text: 'Бургеры',
              ),
              Tab(
                text: 'Закуски',
              ),
              Tab(
                text: 'Напитки',
              ),
              Tab(
                text: 'Соусы',
              ),
            ],
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
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: database.getMenu('Бургер'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewProducts(
                    snapshot: snapshot,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            StreamBuilder(
              stream: database.getMenu('Закуска'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewProducts(
                    snapshot: snapshot,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            StreamBuilder(
              stream: database.getMenu('Напиток'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewProducts(
                    snapshot: snapshot,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            StreamBuilder(
              stream: database.getMenu('Соус'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewProducts(
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
      ),
      length: 4,
    );
  }
}
