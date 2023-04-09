import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/login/loginCubit/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit()  :super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

void userLogin({
  required String email,
  required String pass,
})
{
  emit(LoginLoadingState());

}

}