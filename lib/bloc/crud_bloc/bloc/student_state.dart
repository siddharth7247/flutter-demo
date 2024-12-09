part of 'student_bloc.dart';

sealed class StudentState {}

final class StudentInitial extends StudentState{}

class RefreshStudentState extends StudentState{
  final List<BlocStudent> studentList;
  RefreshStudentState({required this.studentList});
}



