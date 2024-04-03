import 'package:flutter/material.dart';
import 'package:taskhub/controller/user_controller.dart';
import 'package:taskhub/ui/tela_cadastro.dart';

class LoginInicial extends StatefulWidget {
  LoginInicial({super.key});

  @override
  State<LoginInicial> createState() => _LoginInicialState();
}

class _LoginInicialState extends State<LoginInicial> {
  UserController userController = UserController();

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
              child: Text("Login", style: TextStyle(fontSize: 18),),
            ),
            SizedBox( height: 16),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: ()  {
              
                userController.login(context,emailController.text, senhaController.text);
              
              

            }, child: const Text('Entrar')),
            SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cadastro()),
                 );
              },
              child: SizedBox(
                width: 180,
                child: Text("Não tem uma conta? Cadastre-se!", textAlign: TextAlign.center,)),
            )

          ],
        ),
      ),
    );
  }
}