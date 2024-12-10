import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/crud_bloc/bloc/student_bloc.dart';
import 'package:flutter_demo/bloc/models/stduent_blco_model.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  StudentBloc studentBloc = StudentBloc();
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  void validate() {
    if (_formKey.currentState!.validate()) {
      setState(
        () {
          isValid = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            if (state is RefreshStudentState) {
              return ListView.builder(
                itemCount: state.studentList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Name : ${state.studentList[index].name}"),
                              Text("age : ${state.studentList[index].age}"),
                              Text(
                                  "Address : ${state.studentList[index].address}"),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    nameController.text = state
                                        .studentList[index].name
                                        .toString();
                                    ageController.text =
                                        state.studentList[index].age.toString();
                                    addressController.text = state
                                        .studentList[index].address
                                        .toString();
                                    showDialog(
                                      context: context,
                                      builder: (context1) => AlertDialog(
                                        titlePadding: const EdgeInsets.all(0),
                                        title: Container(
                                          height: 80,
                                          width: 500,
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.add_circle_outline_outlined,
                                            size: 50,
                                          ),
                                        ),
                                        content: Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextfield(
                                                controller: nameController,
                                                hintText: 'Enter name',
                                                icon: Icons.person,
                                                validator: 'name',
                                              ),
                                              CustomTextfield(
                                                controller: ageController,
                                                hintText: 'Enter Age',
                                                icon: Icons.person_3,
                                                validator: 'age',
                                              ),
                                              CustomTextfield(
                                                  controller: addressController,
                                                  hintText: 'Enter address',
                                                  icon: Icons.location_on),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.deepPurple,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    minimumSize:
                                                        const Size(200, 50)),
                                                onPressed: () {
                                                  validate();
                                                  if (isValid) {
                                                    context
                                                        .read<StudentBloc>()
                                                        .add(
                                                          UpdateStudentevent(
                                                            index: index,
                                                            student:
                                                                BlocStudent(
                                                              name: nameController
                                                                  .text
                                                                  .toString(),
                                                              age: int.parse(
                                                                  ageController
                                                                      .text),
                                                              address:
                                                                  addressController
                                                                      .text
                                                                      .toString(),
                                                            ),
                                                          ),
                                                        );
                                                    Navigator.pop(context);
                                                    clear();
                                                  }
                                                },
                                                child: const Text(
                                                  'Update',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  context.read<StudentBloc>().add(
                                        DeleteStudentEvent(index: index),
                                      );
                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is StudentInitial) {
              return const Center(child: Text("Nothing to Show"));
            }
            return const Text("Something Went Wrong");
          },
        ),
        floatingActionButton: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context1) => AlertDialog(
                    titlePadding: const EdgeInsets.all(0),
                    title: Container(
                      height: 80,
                      width: 500,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 50,
                      ),
                    ),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextfield(
                            controller: nameController,
                            hintText: 'Enter name',
                            icon: Icons.person,
                            validator: 'name',
                          ),
                          CustomTextfield(
                            controller: ageController,
                            hintText: 'Enter Age',
                            icon: Icons.person_3,
                            validator: 'age',
                          ),
                          CustomTextfield(
                              controller: addressController,
                              hintText: 'Enter address',
                              icon: Icons.location_on),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: const EdgeInsets.all(10),
                                minimumSize: const Size(200, 50)),
                            onPressed: () {
                              validate();
                              if (isValid) {
                                context.read<StudentBloc>().add(
                                      AddStudentEvent(
                                        student: BlocStudent(
                                          name: nameController.text.toString(),
                                          age: int.parse(ageController.text),
                                          address:
                                              addressController.text.toString(),
                                        ),
                                      ),
                                    );
                                Navigator.pop(context);
                                clear();
                              }
                            },
                            child: const Text(
                              'Add Employee',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void clear() {
    nameController.clear();
    ageController.clear();
    addressController.clear();
  }
}
