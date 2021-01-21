import 'package:flutter/material.dart';
import 'package:project1/bloc/authorization/authorization.dart';
import 'package:project1/bloc/authorization/authorization_bloc_provider.dart';
import 'package:project1/datastore/shared_prefs.dart';
import 'package:project1/home_screen.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  AuthorizationBloc _bloc;

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = AuthorizationProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown[100],
          ),
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Добро пожаловать!',
                style: Theme.of(context).textTheme.headline,
              ),
              StreamBuilder(
                stream: _bloc.userName,
                builder: (context, snapshot) => TextFormField(
                  onChanged: _bloc.changeUserName, //когда изменяется текстовое поле у меня эта функция добавляет на вход
                                                    // в stream мой введённый текст (заменяет то что было до, тем  что стало)
                  decoration: InputDecoration(
                    hintText: 'Имя',
                    errorText: snapshot.error,
                  ),
                ),
              ),
              StreamBuilder(
                stream: _bloc.phoneNumber,
                builder: (context, snapshot) => TextFormField(
                  onChanged: _bloc.changePhoneNumber,
                  decoration: InputDecoration(
                    hintText: 'Телефон',
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                color: Colors.brown[200],
                child: Text('ВХОД'),
                // чтобы ты не могла вернуться обратно на экран авторизации
                // после того как уже савторизировалась
                onPressed: () => checkValidate(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorMessage() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Проверьте введённые поля'),
      ),
    );
  }

  void checkValidate() {
    if (_bloc.validateFiels()) {
      SharedPrefs.setData(
          name: _bloc.getUserName, phoneNumber: _bloc.getPhoneNumber);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      showErrorMessage();
    }
  }
}
