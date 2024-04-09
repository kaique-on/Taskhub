import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  final senhaConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        TextFormField(
              controller: senhaConfirm,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'Senha Nova', fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withAlpha(80), width: 0),
                        borderRadius: const BorderRadius.all(
                        Radius.circular(8),
            ))),   
        ),
      ),
    );
  }
}