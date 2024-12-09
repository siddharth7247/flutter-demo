part of 'student_bloc.dart';

sealed class StudentEvent {}

class AddStudentEvent extends StudentEvent{
  final BlocStudent student;
  AddStudentEvent({required this.student});
}

class UpdateStudentevent extends StudentEvent{
  final BlocStudent student;
  final int index;
  UpdateStudentevent({required this.student,required this.index});
}

class DeleteStudentEvent extends StudentEvent{
  final int index;
  DeleteStudentEvent({required this.index});
}