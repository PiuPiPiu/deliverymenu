import 'package:project1/other/validation.dart';
import 'package:rxdart/rxdart.dart';

class AuthorizationBloc {
  final _userName = BehaviorSubject<String>();  // Создаем переменные 
  final _phoneNumber = BehaviorSubject<String>();
 //на выходе из Stream я получаю _userName.stream. Нужно провалидировать эти данные
  Stream<String> get userName =>
      _userName.stream.transform(FieldsValidation.validateUserName);

  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(FieldsValidation.validatePhoneNumber);

  Function(String) get changeUserName => _userName.sink.add; 

  Function(String) get changePhoneNumber => _phoneNumber.sink.add;

  String get getUserName => _userName.value;

  String get getPhoneNumber => _phoneNumber.value;
  //функция нужна чтобы проверять валидацию текущих полей при нажатии на кнопку войти. При неправильном вводе появляется snackbar с сообщение об ошибке
  bool validateFiels() {
    final hasValidation = _userName.value != null;
    if (hasValidation) {
      try {
        if (RegExp(r'^(?:[+0])?[0-9]{11}').hasMatch(_phoneNumber.value)) {
          return true;
        }
        return false;
      } catch (_) {
        return false;
      }
    }
    return false;
  }

  dispose() {
    _userName.close();
    _phoneNumber.close();
  }
}
