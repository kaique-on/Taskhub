class User {

  String email;
  String senha;
  String nome;
  String imagem = "https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg";

  User({ required this.email, required this.senha, required this.nome});

  @override
  String toString(){
    return "nome: $nome, senha: $senha, email: $email";
  }

}