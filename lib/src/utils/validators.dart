import 'dart:async';

import 'package:validators/validators.dart';

/// Utility class which contains validation streams used in form validation
///
class Validators {
  final StreamTransformer<String, String> validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (String email, EventSink<String> sink) {
    if (email.isEmpty || email.trim().isEmpty) {
      sink.add(null);
      sink.addError('error_field_empty');
    } else if (!isEmail(email)) {
      sink.add(null);
      sink.addError('error_field_email_invalid');
    } else {
      sink.add(email);
    }
  });

  final StreamTransformer<String, String> validateNotEmpty =
  StreamTransformer<String, String>.fromHandlers(handleData: (String value, EventSink<String> sink) {
    if (value.isEmpty || value.trim().isEmpty) {
      sink.add(null);
      sink.addError('error_field_empty');
    } else {
      sink.add(value);
    }
  });

  final StreamTransformer<String, String> validatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (String password, EventSink<String> sink) {
    if (password.length > 7) {
      sink.add(password);
    } else {
      sink.add(null);
      sink.addError('error_field_password_length');
    }
  });
}
