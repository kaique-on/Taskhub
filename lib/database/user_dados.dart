import 'package:taskhub/model/user_model.dart';

class ListaDoUsuario {
  
   static List<User> user = [
    User(email: 'emaill', senha: 'senhaa', nome: 'Davi') //0

  ];

  static List<User> getterUsuarios() {
    return user;
  }

}