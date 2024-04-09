import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskhub/controller/user_controller.dart';

class AlterarEmail extends StatefulWidget {
  final int index;
  
   AlterarEmail({super.key, required this.index});

  @override
  State<AlterarEmail> createState() => _AlterarEmailState();
}

class _AlterarEmailState extends State<AlterarEmail> {
  UserController metodos = UserController();

  final emailAntigo = TextEditingController();
  final emailNovo = TextEditingController();
  final emailConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: 
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: emailAntigo,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Email antigo', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            TextFormField(
                controller: emailNovo,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Email novo', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            TextFormField(
                controller: emailConfirm,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Confirmar email', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                    metodos.verificarEmail(context, emailConfirm.text, emailNovo.text,emailAntigo.text, widget.index);
                    });
                  }, 
                  child:  Text('Atualizar dados', style: GoogleFonts.nunitoSans(color: Colors.purple, fontSize: 16), )),
              ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )],
        ),
         ),
      ),
    );
  }
}