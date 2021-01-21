import 'package:flutter/cupertino.dart';
import 'package:project1/bloc/authorization/authorization.dart';

class AuthorizationProvider extends InheritedWidget {
  final bloc = AuthorizationBloc();

  AuthorizationProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthorizationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthorizationProvider)
            as AuthorizationProvider)
        .bloc;
  }
}
