import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:flutter_demo/models/employeeModel.dart';
import 'package:flutter_demo/services/database_service.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: _employeeList(),
      floatingActionButton: _addEmployeeButton(),
    );
  }

  Widget _employeeList() {
    return FutureBuilder(
      future: _databaseService.getAllEmployee(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _updateEmployeeButton(snapshot.data![index]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _databaseService
                                .deleteEmloyee(snapshot.data![index].id!);
                          });
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _addEmployeeButton() {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _databaseService.getAllEmployee();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                  height: 80,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.add_circle_outline_outlined,
                    size: 50,
                  )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter name',
                      icon: Icons.person),
                  CustomTextfield(
                      controller: emailController,
                      hintText: 'Enter email',
                      icon: Icons.email),
                  CustomTextfield(
                      controller: addressController,
                      hintText: 'Enter address',
                      icon: Icons.location_on),
                  CustomTextfield(
                      controller: phoneController,
                      hintText: 'Enter mobile no',
                      icon: Icons.phone),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size(200, 50)),
                      onPressed: () {
                        _databaseService.addEmployee(Employee(
                            id: null,
                            name: nameController.text.toString(),
                            email: emailController.text.toString(),
                            address: addressController.text.toString(),
                            phoneNo: int.parse(phoneController.text)));

                        Navigator.pop(context);
                        setState(() {
                          clearController();
                        });
                      },
                      child: const Text(
                        'Add Employee',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          );
        });
  }

  Widget _updateEmployeeButton(Employee employee) {
    return IconButton(
        onPressed: () {
          nameController.text = employee.name;
          emailController.text = employee.email;
          addressController.text = employee.address;
          phoneController.text = employee.phoneNo.toString();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                  height: 80,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.add_circle_outline_outlined,
                    size: 50,
                  )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextfield(
                      controller: nameController,
                      hintText: 'Enter name',
                      icon: Icons.person),
                  CustomTextfield(
                      controller: emailController,
                      hintText: 'Enter Email',
                      icon: Icons.email),
                  CustomTextfield(
                      controller: addressController,
                      hintText: 'Enter Address',
                      icon: Icons.location_on),
                  CustomTextfield(
                      controller: phoneController,
                      hintText: 'Enter Phone no',
                      icon: Icons.phone),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(10),
                              minimumSize: const Size(130, 50)),
                          onPressed: () {
                            updateEmployee(Employee(
                                id: employee.id,
                                name: nameController.text,
                                email: emailController.text,
                                address: addressController.text,
                                phoneNo: int.parse(phoneController.text)));
                            Navigator.pop(context);
                            setState(() {
                              clearController();
                            });
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(10),
                              minimumSize: const Size(130, 50)),
                          onPressed: () {
                            Navigator.pop(context);
                            clearController();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        icon: const Icon(Icons.edit));
  }

  void updateEmployee(Employee employee) {
    _databaseService.updateEmployee(Employee(
      id: employee.id,
      name: employee.name,
      email: employee.email,
      address: employee.address,
      phoneNo: employee.phoneNo,
    ));
  }

  void clearController() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
  }
}
