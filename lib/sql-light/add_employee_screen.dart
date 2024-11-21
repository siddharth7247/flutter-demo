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
                leading: CircleAvatar(child: Text((snapshot.data![index].id).toString()),),
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
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
                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          addressController.clear();
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
        }
      );
  }
}
