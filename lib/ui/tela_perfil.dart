import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskhub/controller/user_controller.dart';
import 'package:taskhub/database/user_dados.dart';
import 'package:taskhub/model/user_model.dart';
import 'package:taskhub/ui/confirmar_email.dart';
import 'package:taskhub/ui/confirmar_senha.dart';
import 'package:taskhub/ui/imagem_editar.dart';
import 'package:taskhub/ui/tela_inicial.dart';
import 'package:taskhub/ui/tela_login.dart';

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
  bool botaoAtivado = false;

   @override
  void initState () {
    super.initState();
    emailEdit.text = lista[widget.index].email;
    nomeEdit.text = lista[widget.index].nome;
    senhaEdit.text = lista[widget.index].senha;
  }

  bool eyeText = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            GestureDetector(
              onTap: () {showDialog(context: context, builder: (BuildContext context) {
                  return AlterarImagem(index: widget.index);
                });},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(height: 100, width: 100, '${lista[widget.index].imagem}'))),
        
            GestureDetector(
                onTap: () {showDialog(context: context, builder: (BuildContext context) {
                  return AlterarImagem(index: widget.index);
                });},
                child: Row(
                  children: [
                    Text("Alterar imagem"),
                    SizedBox(width: 4),
                    Icon(Icons.edit)
                  ],
                ),
              ),
        
            
        ],),
        
        // TextFormField(
        // controller: emailEdit,
        //     style: const TextStyle(color: Colors.black),
        //     decoration: InputDecoration(
        //   labelText: 'Email', fillColor: Colors.black,
        //   border: OutlineInputBorder(
        //       borderSide: BorderSide(
        //           color: Colors.white, width: 0),
        //           borderRadius: const BorderRadius.all(
        //           Radius.circular(8),
        //     ))),    
        // ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: TextFormField(
                controller: nomeEdit,
                onChanged: (value) {
                  setState(() {
                    botaoAtivado = nomeEdit.text.isNotEmpty;
                  });
                },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: 'Nome de Usuário', fillColor: Colors.black,
                  contentPadding: EdgeInsets.symmetric(vertical: -2)
                  ),    
          ),
        ),
        SizedBox(height: 8),

        Container(
                width: double.infinity,
                height: 36,
                margin: EdgeInsets.all(8),
                
                child: ElevatedButton(
                  
                  onPressed: botaoAtivado ? (){
                  User usuarioEditado = User(email: emailEdit.text, senha: senhaEdit.text, nome: nomeEdit.text);
                    setState(() {
                      metodos.editar(context, widget.index, usuarioEditado, senhaConfirmar);
                    });
                  } : null, 
                  child:  Text('Atualizar dados', style: GoogleFonts.nunitoSans(color: Colors.purple, fontSize: 16), )),
              ),
        // TextFormField(
        //       controller: senhaConfirmar,
        //     style: const TextStyle(color: Colors.black),
        //     decoration: InputDecoration(
        //         labelText: 'Senha atual', fillColor: Colors.black,
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Colors.grey.withAlpha(80), width: 0),
        //                 borderRadius: const BorderRadius.all(
        //                 Radius.circular(8),
        //     ))),  
        //     obscureText: true,  
        // ),
        // SizedBox(height: 8),
        // // TextFormField(
        //       controller: senhaEdit,
        //     style: const TextStyle(color: Colors.black),
        //     decoration: InputDecoration(
        //         labelText: 'Senha Nova', fillColor: Colors.black,
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Colors.grey.withAlpha(80), width: 0),
        //                 borderRadius: const BorderRadius.all(
        //                 Radius.circular(8),
        //     ))),   
        //     obscureText: true, 
        // ),

        SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Email: '),
                  Text('•' * emailEdit.text.length, style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return AlterarEmail(index: widget.index);
                  });
                },
                child: Row(
                  children: [
                    Text("Alterar email"),
                    SizedBox(width: 4),
                    Icon(Icons.edit)
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Senha: '),
                  Text('•' * senhaEdit.text.length, style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return AlterarSenha(index: widget.index);
                  });
                },
                child: Row(
                  children: [
                    Text("Alterar senha"),
                    SizedBox(width: 4),
                    Icon(Icons.edit)
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8,),
        
        

              SizedBox(height: 16),
          
          Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
            onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginInicial()));
                  },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Logout", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 6),
                    Icon(Icons.logout, color: Colors.white),
                  ],
                ),
              ),
            ),
          )
        
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
            Container(height: double.infinity, width: 1, decoration: BoxDecoration(color: Colors.grey)),
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
    );
  }
}