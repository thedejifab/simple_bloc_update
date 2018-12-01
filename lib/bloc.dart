import 'model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class MyTextBloc {
  final Utils util;
  Stream<MyText> _result = Stream.empty();
  Stream<String> _log = Stream.empty();
  ReplaySubject<String> _initialText = ReplaySubject<String>();

  Stream<String> get log => _log;
  Stream<MyText> get result => _result;
  Sink<String> get initialText => _initialText;

  MyTextBloc(this.util) {
    _result = _initialText.distinct().asyncMap(util.get).asBroadcastStream();

    _log = Observable(result)
        .withLatestFrom(
            _initialText.stream, (_, initialText) => "Results for $initialText")
        .asBroadcastStream();
  }

  void dispose(){
    _initialText.close();
  }
}
