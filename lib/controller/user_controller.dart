import 'package:flutter/material.dart';
import 'package:taskhub/database/user_dados.dart';

import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/tela_inicial.dart';

class UserController  {

    
    void cadastrar(context, User user){
    
        
        var result = ListaDoUsuario.user.where((item) => item.email == user.email);

         
        if (user.email.contains('@') && user.email.contains('.com')){
            print(ListaDoUsuario.user);
            ListaDoUsuario.user.add(user);
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
        
        print(ListaDoUsuario.user);
        var result = ListaDoUsuario.user.where((item) => item.email == email && item.senha == senha);
        var index = ListaDoUsuario.user.indexWhere((item) => item.email == email);
        if(result.isNotEmpty){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> TelaInicial(index: index)), (route) => false, );
        }else{
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

    editar(context, index, User lista, senhaConfirmar){
    if(lista.email.isEmpty){
        lista.email = ListaDoUsuario.user[index].email;
    }else if(lista.nome.isEmpty){
        lista.nome = ListaDoUsuario.user[index].nome;
    }else if(lista.senha.isEmpty){
        lista.senha = ListaDoUsuario.user[index].senha;
    }else if(lista.email.isNotEmpty && !lista.email.contains('@') && !lista.email.contains('.com')){
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Email inválido, tente inserir credencias válidas', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error)
                    ],
                )));
        lista.email = ListaDoUsuario.user[index].email;
    }
    else if(lista.nome.isEmpty && lista.senha.isEmpty  && lista.email.isEmpty){
        return 'Insira algum texto para editar';
    }

    ListaDoUsuario.user.setAll(index, [lista]);
    print(ListaDoUsuario.user[index]);
   }
    verificarSenhaIgual(context, senhaConfirm, senhaNova, index){
      if (senhaConfirm == senhaNova){
       ListaDoUsuario.user[index].senha = senhaNova;
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Senha alterada com sucesso! Em alguns segundos, será atualizada', style: TextStyle(fontSize: 10),),
                        Icon(Icons.check, color: Colors.green,)
                    ],
                )));
      }else{
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Increndecias inválidas', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error, color: Colors.red,)
                    ],
                )));
      }
      print(ListaDoUsuario.user[index]);
    }


 } 


