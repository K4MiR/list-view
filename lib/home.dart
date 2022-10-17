import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List _itens = [];

  void _carregarItens(){
    for(int i=0; i<=10; i++) {
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
            itemBuilder: (context, indice)  {
              Map<String, dynamic> item = _itens[indice] ;
              //print("intem ${ _itens[indice]["título"] }");

              return ListTile(
                title: Text( _itens[indice]["título"]),
                subtitle: Text(_itens[indice]["descrição"]),

              );
            }
            ),
      ),
    );
  }
}
