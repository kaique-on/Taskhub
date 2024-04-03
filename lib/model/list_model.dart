class Lista {
  String texto;
  bool isChecked;

  Lista({required this.texto, required this.isChecked});

  @override
  String toString(){
    return "nome: $texto, checado: $isChecked";
  }

}
