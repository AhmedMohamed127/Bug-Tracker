import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/register/registerCubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisteritialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String pass,
    required String name,
    required String team,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      emit(RegisterOnSuccessState());
    })
        .catchError((error){
          emit(RegisterOnErrorState(error));
          print(error.toString());
    }) ;
  }
}
