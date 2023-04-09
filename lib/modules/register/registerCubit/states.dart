abstract class RegisterStates{}

class RegisteritialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterOnSuccessState extends RegisterStates{}

class RegisterOnErrorState extends RegisterStates{
  String error;
  RegisterOnErrorState(this.error);
}

