class User {

  String email;
  String senha;
  String nome;

  User({ required this.email, required this.senha, required this.nome});

  @override
  String toString(){
    return "nome: $nome";
  }

}