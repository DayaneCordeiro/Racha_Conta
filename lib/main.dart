import 'package:flutter/material.dart';
import 'consumo_total.dart';
import 'primeiro_passo.dart';

void main() {
  runApp(MyApp()); /* Chama a classe como se fosse uma função */
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /* Função que preenche os espaços da tela, barra de cima... */
        appBar: AppBar(
          title: Text('Racha conta', style: TextStyle(fontFamily: 'Poppins', color: new Color(0XFF3c3b40)),),
          backgroundColor: new Color(0xFFF9AC18),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text('Como você gostaria de dividir a conta?'),
            RaisedButton(
              child: Text('Mesmo valor para todos'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConsumoTotal()),
                );
              }
            ),
            RaisedButton(
              child: Text('Pelo consumo individual'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrimeiroPasso()),
                );
              },
            ),
          ]
        )
      );
  }
}

