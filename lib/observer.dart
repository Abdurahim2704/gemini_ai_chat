import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class MyObeserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("State changed: ${bloc.runtimeType} $change");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint("Event changed: ${bloc.runtimeType} $event");
  }
}
