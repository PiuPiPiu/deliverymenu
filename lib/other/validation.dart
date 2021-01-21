import 'dart:async';

class FieldsValidation {
  static final validateUserName =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (userName, sink) {
      if (userName.length > 0) {
        sink.add(userName);
      } else {
        sink.addError('Имя не может быть пустым');
      }
    },
  );

  static final validatePhoneNumber =
  StreamTransformer<String, String>.fromHandlers(
    handleData: (phoneNumber, sink) {
      if (RegExp(r'^(?:[+0])?[0-9]{11}').hasMatch(phoneNumber)) {
        sink.add(phoneNumber);
      } else {
        sink.addError('Неверный номер телефона');
      }
    },
  );
}
