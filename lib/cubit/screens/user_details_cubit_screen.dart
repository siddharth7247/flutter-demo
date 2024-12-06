import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/cubit/cubits/user_cubit_cubit.dart';

class UserDetailsCubitScreen extends StatefulWidget {
  const UserDetailsCubitScreen({super.key});

  @override
  State<UserDetailsCubitScreen> createState() => _UserDetailsCubitScreenState();
}

class _UserDetailsCubitScreenState extends State<UserDetailsCubitScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubitCubit>(
      create: (context) => UserCubitCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Cubit Demo"),
            ),
            body: Center(
              child: BlocBuilder<UserCubitCubit, UserState>(
                builder: (context, state) {
                  if (state is InitialState) {
                    return const Center(
                      child: Text('Nothing to show'),
                    );
                  } else if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state is SuccessState) {
                    return ListView.builder(
                      itemCount: state.userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Name : ${state.userList[index].name}"),
                                Text("Email : ${state.userList[index].email}"),
                                Text(
                                    "Address : ${state.userList[index].address.city} - ${state.userList[index].address.zipcode}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is Errorstate) {
                    return const Center(
                      child: Text('Some Thing Went Wrong'),
                    );
                  }
                  return Container();
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<UserCubitCubit>().getUserData();
              },
              child: const Icon(Icons.replay_outlined),
            ),
          );
        },
      ),
    );
  }
}
