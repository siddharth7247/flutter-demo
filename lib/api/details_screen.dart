import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String imgUrl;
  const DetailsScreen({super.key, required this.imgUrl});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Hero(
        tag: widget.imgUrl,
        child: Image.network(widget.imgUrl,
            fit: BoxFit.cover, width: media.width, height: media.height / 2.5),
      )),
    );
  }
}
