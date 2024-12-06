import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/cubit/models/user_model.dart';
part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserState> {
  UserCubitCubit() : super(InitialState());

  getUserData() async {
    try {
      emit(LoadingState());
      final dio = Dio();
      const String baseUrl = 'https://jsonplaceholder.typicode.com/users';
      final responce = await dio.get(baseUrl);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        log("Api responce ${responce.data}");
        var userList = (responce.data as List)
            .map((json) => UserModel.fromJson(json))
            .toList();
        log("User List Lenght ${userList.length}");
        emit(SuccessState(userList: userList));
      } else {
        emit(Errorstate(message: "Somthing went wrong"));
      }
    } catch (e) {
      emit(Errorstate(message: "Exception occured $e"));
    }
  }
}
