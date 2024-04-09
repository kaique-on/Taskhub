import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskhub/controller/user_controller.dart';
import 'package:taskhub/database/user_dados.dart';
import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/tela_inicial.dart';

class TelaPerfil extends StatefulWidget {
  
  final int index;
  const TelaPerfil({super.key, required this.index});
  

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {

  

  List<User> lista = ListaDoUsuario.getterUsuarios();
  UserController metodos = UserController();

  final emailEdit = TextEditingController();
  final nomeEdit = TextEditingController();
  final senhaEdit = TextEditingController();
  final senhaConfirmar = TextEditingController();

   @override
  void initState () {
    super.initState();
    emailEdit.text = lista[widget.index].email;
    nomeEdit.text = lista[widget.index].nome;
    senhaEdit.text = lista[widget.index].senha;
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("${lista[widget.index].email}"),
            Text("${lista[widget.index].senha}"),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Image.network(height: 100, width: 100, '${lista[widget.index].imagem}'),
        
            ElevatedButton(
              onPressed: (){}, 
            child: Icon(Icons.edit)
            ),
        
            
        ],),
        
        TextFormField(
        controller: emailEdit,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
          labelText: 'Email', fillColor: Colors.black,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, width: 0),
                  borderRadius: const BorderRadius.all(
                  Radius.circular(8),
            ))),    
        ),
        SizedBox(height: 8),
        TextFormField(
              controller: nomeEdit,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'Nome de Usuário', fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withAlpha(80), width: 0),
                        borderRadius: const BorderRadius.all(
                        Radius.circular(8),
            ))),    
        ),
        SizedBox(height: 8),
        TextFormField(
              controller: senhaConfirmar,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'Senha atual', fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withAlpha(80), width: 0),
                        borderRadius: const BorderRadius.all(
                        Radius.circular(8),
            ))),  
            obscureText: true,  
        ),
        SizedBox(height: 8),
        TextFormField(
              controller: senhaEdit,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'Senha Nova', fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withAlpha(80), width: 0),
                        borderRadius: const BorderRadius.all(
                        Radius.circular(8),
            ))),   
            obscureText: true, 
        ),
        
        Container(
                width: double.infinity,
                height: 30,
                margin: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: (){
                  User usuarioEditado = User(email: emailEdit.text, senha: senhaEdit.text, nome: nomeEdit.text);
                    setState(() {
                      metodos.editar(context, widget.index, usuarioEditado, senhaConfirmar);
                    });
                  }, 
                  child:  Text('Atualizar dados', style: GoogleFonts.nunitoSans(color: Colors.purple, fontSize: 16), )),
              ),
        
          ],
        ),
      ),
      

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaInicial(index: widget.index,)),
                 );
              },
            ),
            SizedBox(), // Espaço vazio no meio 
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPerfil(index: widget.index,)),
                 );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}