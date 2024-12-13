import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/todoModel.dart';
import 'package:http/http.dart' as http;

class IsolateDemoScreen extends StatefulWidget {
  const IsolateDemoScreen({super.key});

  @override
  State<IsolateDemoScreen> createState() => _IsolateDemoScreenState();
}

class _IsolateDemoScreenState extends State<IsolateDemoScreen> {
  TextEditingController factController = TextEditingController();
  int? factorial = 0;
  bool isLoading = false;
  String url = 'https://jsonplaceholder.typicode.com/todos/';
  Future<List<Todos>>? todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image.asset('assets/images/dog.gif'),
                ElevatedButton(onPressed: () {}, child: const Text('Task 1')),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: factController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter number to calculate factorial'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final receivePort = ReceivePort();
                            await Isolate.spawn(
                                calculateFactorial,
                                Data(int.parse(factController.text),
                                    receivePort.sendPort));
                            receivePort.listen((fact) {
                              factorial = fact;
                              setState(() {});
                            });
                          },
                          child: const Text('Calculate')),
                      Text('$factorial')
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Task 2')),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter image Url to Download'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            final receivePort = ReceivePort();
                            await Isolate.spawn(
                                downloadImage, receivePort.sendPort);
                            receivePort.listen((Data) {
                              setState(() {
                                isLoading = Data;
                              });
                            });
                          },
                          child: (isLoading)
                              ? const CircularProgressIndicator(
                                  color: Colors.amber)
                              : const Text('Dowload')),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      todoList = fetchTodoes();
                      setState(() {});
                    },
                    child: const Text("Parse Json")),
                const SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                  future: todoList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 300,
                        width: 400,
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title:
                                    Text(snapshot.data![index].id.toString()),
                                subtitle: Text(
                                    snapshot.data![index].title.toString()),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                          // child: CircularProgressIndicator(),
                          );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Todos>> fetchTodoes() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));
  return compute(parseTodos, response.body);
}

calculateFactorial(Data data) {
  int factorial = 1;
  for (int i = 1; i <= data.number; i++) {
    factorial = factorial * i;
  }
  data.sendPort.send(factorial);
}

downloadImage(SendPort sendPort) async {
  await Future.delayed(const Duration(seconds: 20));
  sendPort.send(false);
}

class Data {
  final int number;
  final SendPort sendPort;
  Data(this.number, this.sendPort);
}

List<Todos> parseTodos(String responseBody) {
  final jsonData = jsonDecode(responseBody);
  final finalJson = jsonData as List<dynamic>;
  return finalJson.map((json) => Todos.fromJson(json)).toList();
}
