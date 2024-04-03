import 'package:flutter/material.dart';
import 'package:taskhub/database/user_dados.dart';

import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/tela_inicial.dart';

class UserController  {

    
    void cadastrar(context, User user){
    
        
        var result = ListaUsuarios.user.where((item) => item.email == user.email);


         
        if (user.email.contains('@') && user.email.contains('.com')){
            print(ListaUsuarios.user);
            ListaUsuarios.user.add(user);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    children: [
                        Text('Cadastro concluído, faça o seu login!'),
                        Icon(Icons.check)
                    ],
                )));
        }else if(result.isNotEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Email já existente, tente inserir outro email ou fazer login', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error)
                    ],
                )));
        }else {
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Tente inserir credencias válidas'),
                        Icon(Icons.error)
                    ],
                )));
        }
    }

    void login(context, String email, String senha){
        
        print(ListaUsuarios.user);
        var result = ListaUsuarios.user.where((item) => item.email == email && item.senha == senha);
        var index = ListaUsuarios.user.indexWhere((item) => item.email == email);
        if(result.isNotEmpty){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> TelaInicial(usuario: ListaUsuarios.user[index].nome,)), (route) => false);
        }else{
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Tente inserir credencias válidas'),
                        Icon(Icons.error)
                    ],
                )));
        }
    }
}

