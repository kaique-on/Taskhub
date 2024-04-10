import 'package:flutter/material.dart';
import 'package:taskhub/database/user_dados.dart';

import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/tela_inicial.dart';
import 'package:taskhub/ui/tela_perfil.dart';

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

    editar(context, index, String nomeNovo){
  
    if(nomeNovo.isNotEmpty){
        ListaDoUsuario.user[index].nome = nomeNovo;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Nome alterado com sucesso!', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error, color: Colors.green,)
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
   }

    verificarSenhaIgual(context, String senhaConfirm, String senhaNova, String senhaAtual, index){
      if (senhaConfirm == senhaNova && senhaAtual == ListaDoUsuario.user[index].senha && senhaNova.isNotEmpty){
       Navigator.push(context, MaterialPageRoute(builder:(context) => TelaPerfil(index: index)));
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
    }
    verificarEmail(context, String emailConfirm, String emailNovo, String emailAntigo, index){
      bool emailValido;
      if(emailNovo.contains('@') && emailNovo.contains('.com') && emailNovo == emailConfirm){
        emailValido = true;
      }else{
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Insira um email válido', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error, color: Colors.red,)
                    ],
                )));
      }
      if(emailValido && ListaDoUsuario.user[index].email == emailAntigo && emailNovo.isNotEmpty ){
        ListaDoUsuario.user[index].email = emailNovo;
        Navigator.push(context, MaterialPageRoute(builder:(context) => TelaPerfil(index: index)));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Email alterado com sucesso', style: TextStyle(fontSize: 10),),
                        Icon(Icons.check, color: Colors.green,)
                    ],
                )));
      }
    }
    void adicionarImagem(context, String link, index){
      if(link.isNotEmpty){
        ListaDoUsuario.user[index].imagem = link; ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Foto alterada, a imagem será atualizada ao voltar para página', style: TextStyle(fontSize: 10),),
                        Icon(Icons.check, color: Colors.green,)
                    ],
                )));
      }else{
         ListaDoUsuario.user[index].imagem = link; ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text('Erro insira um link válido', style: TextStyle(fontSize: 10),),
                        Icon(Icons.error, color: Colors.red,)
                    ],
                )));
      }
    }

 } 


