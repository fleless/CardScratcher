import 'dart:async';

import 'package:cardscratcher/src/utils/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

/// This abstract bloc class is used as a parent for form bloc.
/// It provides streams for loading state, errors and input validation.
abstract class AbstractFormBloc extends Validators implements Disposable {
  // Validation stream
  StreamSubscription _validFormSubscription;

  StreamSubscription getValidationStream();

  // Stream controllers
  final PublishSubject<String> _networkErrorSubject = PublishSubject<String>();
  final PublishSubject<bool> _loadingDataSubject = PublishSubject<bool>();
  final BehaviorSubject<bool> _validFormSubject = BehaviorSubject<bool>.seeded(false);

  // Stream setters
  Function(String) get setNetworkError => _networkErrorSubject.sink.add;

  Function(bool) get setLoadingData => _loadingDataSubject.sink.add;

  Function(bool) get setValidForm => _validFormSubject.sink.add;

  // Stream getters
  Stream<String> get error => _networkErrorSubject.stream;

  Stream<bool> get loading => _loadingDataSubject.stream;

  Stream<bool> get validForm => _validFormSubject.stream;

  // Constructor
  AbstractFormBloc() {
    _validFormSubscription = getValidationStream();
    _validFormSubscription?.onError((_) {});
  }

  void handleError(final DioError error) {
    _networkErrorSubject.sink.add(error.message);
  }

  @override
  void dispose() {
    _validFormSubscription?.cancel();
    _networkErrorSubject.close();
    _loadingDataSubject.close();
    _validFormSubject.close();
  }
}
