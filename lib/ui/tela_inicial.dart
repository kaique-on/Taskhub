import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskhub/controller/list_controller.dart';
import 'package:taskhub/database/list_dados.dart';
import 'package:taskhub/model/list_model.dart';

class TelaInicial extends StatefulWidget {
  final String usuario;
  const TelaInicial({super.key, required this.usuario});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {


  List<Lista> usuario = ListaUsuarios.getListaUsuarios();


  ListController listaController = ListController();
  final textoItem = TextEditingController();  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 26),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 4, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seja bem vindo, ${widget.usuario}!', style: GoogleFonts.nunitoSans(color: Colors.black, fontSize: 18)),
              SizedBox(
                height: 4,
              ),
              Text('Sua lista de atividades:', style: GoogleFonts.nunitoSans(color: Colors.black, fontSize: 18))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textoItem,
              decoration: InputDecoration(
                hintText: 'Insira as atividades do dia', hintStyle: GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 16),
                border: OutlineInputBorder()
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: (){
                Lista listinha = Lista(texto: textoItem.text, isChecked: false);  
                  setState(() {
                    listaController.addItem(listinha);
                    
                  });
                }, 
                child:  Text('Adicionar Item', style: GoogleFonts.nunitoSans(color: Colors.purple, fontSize: 16), )),
            ),
            
          Expanded(
          child: ListView.builder(
            itemCount: usuario.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, right: 8, bottom: 8, left: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(usuario[index].texto, style: TextStyle(color: Colors.black)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed: (){
                                    setState(() {
                                      listaController.removeItem(index);
                                    });
                                  },icon: Icon(Icons.delete)),
                                  IconButton(onPressed: (){ setState(() {
                                    listaController.checarItem(index);
                                  });}, icon: usuario[index].isChecked? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank)),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 380,
                          height: 1,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.grey
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ));
            }),
        )
          ],    
        ),
      ),
    );
  }
}