import 'package:flutter/material.dart';
import 'package:taskhub/controller/user_controller.dart';
import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/tela_login.dart';

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  UserController userController = UserController();

  final nomeController = TextEditingController();

  final emailController = TextEditingController();

  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Cadastro", style: TextStyle(fontSize: 18),),
            ),
            SizedBox( height: 16),
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Insira seu nome completo',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox( height: 8),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Insira seu email',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Crie sua senha',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: ()  {
              User user = User(
                  email: emailController.text, 
                  senha: senhaController.text,
                  nome: nomeController.text,
                  );
              setState(() {
                userController.cadastrar(context,user);
              });
            }, child: const Text('Cadastrar')),
            SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginInicial()),
                 );
              },
              child: SizedBox(
                width: 140,
                child: Text("Já tem uma conta? Faça o login!", textAlign: TextAlign.center,)),
            )

          ],
        ),
      ),
    );
  }
}