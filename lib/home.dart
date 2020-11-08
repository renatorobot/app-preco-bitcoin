import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _preco = "0"; 

  void _recuperarPreco() async{

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Preço do bitcoin"), backgroundColor: Colors.black,),

      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(32),
        child: Center(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset("imagens/bitcoin-img.png"),
               Padding(padding: EdgeInsets.only(top:30, bottom: 30), child: Text("R\$ "+ _preco, style: TextStyle(fontSize: 30),),),
               RaisedButton(
                 child: Text("Atualizar preço", style: TextStyle(fontSize: 20, color: Colors.white),),
                 color: Colors.black,
                 onPressed: _recuperarPreco,
               ),
             ],
           ),
         ), 
        ),
      ),
      ),
    );
  }
}