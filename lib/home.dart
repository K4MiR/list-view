import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["título"] = "Título ${i} Lorem ipsum dolor sit amet";
      item["descrição"] = "Descrição ${i} Lorem ipsum dolor sit amet";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              Map<String, dynamic> item = _itens[indice];
              //print("intem ${ _itens[indice]["título"] }");

              return ListTile(
                onTap: () {
                  //print("clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Deseja deletar?"),
                          titlePadding: EdgeInsets.all(20),
                          content: Text(_itens[indice]["descrição"],),
                          contentPadding: EdgeInsets.all(20),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            TextButton(
                                onPressed: (){
                                  print("Selecionado não");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            ),
                          ],
                        );
                      });
                },
                // onLongPress: (){
                //   print("clique com onLongPress");
                // },
                title: Text(_itens[indice]["título"]),
                subtitle: Text(_itens[indice]["descrição"]),
              );
            }),
      ),
    );
  }
}
