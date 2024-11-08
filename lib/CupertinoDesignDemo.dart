import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinodesigScreen extends StatefulWidget {
  const CupertinodesigScreen({super.key});

  @override
  State<CupertinodesigScreen> createState() => _CupertinodesigScreenState();
}

class _CupertinodesigScreenState extends State<CupertinodesigScreen> {
  DateTime dateTime = DateTime.now();

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino design demo'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  CupertinoTextField(
                    prefix: const Text("   Name",style: TextStyle(fontFamily: 'Manrope',fontSize: 20,fontWeight: FontWeight.bold)),
                    style: const TextStyle(fontFamily: 'Manrope', fontSize: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CupertinoTextField(
                    prefix: const Text("   Email",
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(fontFamily: 'Manrope', fontSize: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CupertinoTextField(
                    prefix: const Text("   Address",
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(fontFamily: 'Manrope', fontSize: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CupertinoListSection(
                    backgroundColor: Colors.white,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    children: [
                      CupertinoListTile(
                        title: const Text("Male"),
                        leading: CupertinoRadio(
                            value: "Male",
                            groupValue: "male",
                            onChanged: (Isolate) {}),
                      ),
                      CupertinoListTile(
                        title: const Text("Female"),
                        leading: CupertinoRadio(
                            value: "Male",
                            groupValue: "male",
                            onChanged: (Isolate) {}),
                      ),
                      CupertinoListTile(
                        title: const Text("Other"),
                        leading: CupertinoRadio(
                            value: "Male",
                            groupValue: "male",
                            onChanged: (Isolate) {}),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          this.dateTime = dateTime;
                        });
                      }),
                  CupertinoButton.filled(
                      child: Text("Submit"), onPressed: () {})
                ],
              )),
        ),
      ),
    );
  }
}
