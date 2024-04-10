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
            SizedBox(height: 8,),
            TextFormField(
                controller: emailAntigo,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Email atual', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            TextFormField(
                controller: emailNovo,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Novo email', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            TextFormField(
                controller: emailConfirm,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'Confirmar novo email', fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withAlpha(80), width: 0),
                            borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                ))),   
            ),
            SizedBox(height: 8,),
            Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                    metodos.verificarEmail(context, emailConfirm.text, emailNovo.text,emailAntigo.text, widget.index);
                    });
                  }, 
                  child:  Center(child: Text('Atualizar email', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 16), ))),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(8)),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  }, 
                  child:  Center(child: Text('Fechar', style: GoogleFonts.nunitoSans(color: Colors.white, fontSize: 16), ))),
              ),
              ],
        ),
         ),
      ),
    );
  }
}