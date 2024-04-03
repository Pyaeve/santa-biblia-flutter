// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
    
class VersePage extends StatefulWidget {
  const VersePage({super.key});

  @override
  _VersePageState createState() => _VersePageState();
}

class _VersePageState extends State<VersePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor:  Colors.white,
         backgroundColor: const  Color.fromARGB(255, 3, 23, 112),
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}