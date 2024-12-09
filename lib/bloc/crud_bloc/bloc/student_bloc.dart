import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_demo/bloc/models/stduent_blco_model.dart';
part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<AddStudentEvent>(addStudent);
    on<DeleteStudentEvent>(deleteStudent);
    on<UpdateStudentevent>(updateStudent);
  }

  List<BlocStudent> studentList = [];
  FutureOr<void> addStudent(AddStudentEvent event, Emitter<StudentState> emit) {
      studentList.add(event.student);
      emit(RefreshStudentState(studentList: studentList)); 
  }

  FutureOr<void> deleteStudent(DeleteStudentEvent event, Emitter<StudentState> emit) {
    studentList.removeAt(event.index);
    emit(RefreshStudentState(studentList: studentList));
  }

  FutureOr<void> updateStudent(UpdateStudentevent event, Emitter<StudentState> emit) {
    studentList[event.index] = event.student;
    emit(RefreshStudentState(studentList: studentList));
  }
}
