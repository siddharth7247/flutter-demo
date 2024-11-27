import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_demo/common_widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadDemo extends StatefulWidget {
  const ImageUploadDemo({super.key});

  @override
  State<ImageUploadDemo> createState() => _ImageUploadDemoState();
}

class _ImageUploadDemoState extends State<ImageUploadDemo> {
  File? _image;
  String? _message;
  int? _statusCode;
  TextEditingController subjectController = TextEditingController();
  TextEditingController deseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await selectImage();
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5),
                  ),
                  child: (_image != null)
                      ? Image.file(_image!)
                      : const Icon(Icons.add_a_photo),
                ),
              ),
              CustomTextfield(
                  controller: subjectController,
                  hintText: 'Name',
                  icon: Icons.person),
              CustomTextfield(
                  controller: deseController,
                  hintText: 'Description',
                  icon: Icons.description),
              ElevatedButton(
                onPressed: () async {
                  await uploadImage(subjectController.text.toString(),
                      deseController.text.toString());
                  if (_statusCode == 200 || _statusCode == 201) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0),
                            title: Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  color: Colors.deepPurple),
                              child: const Icon(
                                Icons.warning_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            content: Text(
                              _message ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.deepPurple),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "Ok",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(_message.toString()),backgroundColor: Colors.redAccent,));
                  }
                  clear();
                },
                child: const Text("upload"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(String subject, String description) async {
    const url =
        'https://la10.webdevprojects.cloud/la_surfmap/api/v1/report/report-problem';
    final uri = Uri.parse(url);
    late String message;
    var request = http.MultipartRequest('POST', uri);
    request.headers["Authorization"] =
        'Bearer 867|MFcAVwhY40KictXXQLCy0Dlo6g0GSi4Ox00TDDCr6cda98af';
    request.headers["Accept"] = 'application/json';
    //request.fields['subject'] = subject;
    request.fields['description'] = description;
    request.files
        .add(await http.MultipartFile.fromPath('images[]', _image!.path));
    final streamResponce = await request.send();

    if (streamResponce.statusCode == 200) {
      log("Api Responce : ${streamResponce.statusCode}");
      var responce = await http.Response.fromStream(streamResponce);
      var data = responce.body;
      var jsonData = jsonDecode(data);
      message = jsonData['message'];
      setState(() {
        _statusCode = responce.statusCode;
        _message = message;
      });
    } else {
      var responce = await http.Response.fromStream(streamResponce);
      var data = responce.body;
      var jsonData = jsonDecode(data);
      message = jsonData["meta"]['message'];
      log("responce message else: $message");
      setState(() {
        _statusCode = responce.statusCode;
        _message = message;
      });
    }
  }

  Future<void> selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    log("Image path : ${image?.path}");
    _image = File(image!.path);
  }

  void clear() {
    subjectController.clear();
    deseController.clear();
    setState(() {
      _image = null;
    });
  }
}
