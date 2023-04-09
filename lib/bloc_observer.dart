import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver
{
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print('OnCreate -- ${bloc.runtimeType}');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('OnChange -- ${bloc.runtimeType}, $change' );
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print('OnChange -- ${bloc.runtimeType}, $error, ' );
  }
  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}