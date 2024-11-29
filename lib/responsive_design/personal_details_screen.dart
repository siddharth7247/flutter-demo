import 'package:flutter/material.dart';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';

class PersonalDetailsScreen extends StatelessWidget {
  PersonalDetailsScreen({super.key});
  TextEditingController uerNameController = TextEditingController();
  TextEditingController feedBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Card(
            color: Colors.deepPurple.shade100,
            child: Container(
              height: constraints.maxHeight * 1,
              width: constraints.maxWidth * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "FeedBack",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  CustomTextfield(
                      controller: uerNameController,
                      hintText: 'Enter UserName',
                      icon: Icons.person),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: feedBackController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Feed back',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Back"),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Submit'))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
