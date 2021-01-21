import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/datastore/shared_prefs.dart';
import 'package:project1/login.dart';
import 'bloc/add_to_cart/bloc.dart';
import 'bloc/authorization/authorization_bloc_provider.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPrefs.getData();
  bool hasLoginData = prefs is! bool ? true : false;
  runApp(
    BlocProvider<AddToCartBloc>(
      create: (context) => AddToCartBloc(),
      child: AuthorizationProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: hasLoginData ? HomeScreen() : MyLogin(),
        ),
      ),
    ),
  );
}
