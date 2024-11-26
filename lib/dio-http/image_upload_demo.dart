import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadDemo extends StatefulWidget {
  const ImageUploadDemo({super.key});

  @override
  State<ImageUploadDemo> createState() => _ImageUploadDemoState();
}

class _ImageUploadDemoState extends State<ImageUploadDemo> {
  late File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  log("Image path : ${image?.path}");
                  _image = File(image!.path);
                },
                child: const Text("Select image")),
            ElevatedButton(
              onPressed: () async{
                
               ;
              },
              child: const Text("upload"),
            )
          ],
        ),
      ),
    );
  }
  void uploadImage()async{
    const url = 'https://la10.webdevprojects.cloud/la_surfmap/api/v1/report/report-problem';
    final uri = Uri.parse(url);
    var request = new http.MultipartRequest('POST',uri);
    request.fields['subject'] = "Test subject";
    request.fields['description'] = "Test Dese";
    request.files.add()
  }
}
