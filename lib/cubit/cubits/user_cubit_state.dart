
part of 'user_cubit_cubit.dart';

abstract class UserState{}

class InitialState extends UserState{}

class LoadingState extends UserState{

}

class SuccessState extends UserState{
  final List<UserModel> userList;
  SuccessState({required this.userList});
}

class Errorstate extends UserState{
  final String message;
  Errorstate({required this.message});
}