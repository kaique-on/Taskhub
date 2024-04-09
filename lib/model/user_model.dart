class User {

  String email;
  String senha;
  String nome;
  String imagem = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";

  User({ required this.email, required this.senha, required this.nome});

  @override
  String toString(){
    return "nome: $nome, senha: $senha, email: $email";
  }

}