import 'package:flutter/material.dart';
import 'segundo_passo.dart';
void main() => runApp(ConsumoIndividual());

class ConsumoIndividual extends StatefulWidget {
  @override
  ConsumoIndividualState createState() => ConsumoIndividualState();
}

class ConsumoIndividualState extends State<ConsumoIndividual> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /* Função que preenche os espaços da tela, barra de cima... */
        appBar: AppBar(
          title: Text('Racha conta', style: TextStyle(fontFamily: 'Poppins', color: new Color(0XFF3c3b40)),),
          backgroundColor: new Color(0xFFF9AC18),
          centerTitle: true,
        ),
        body: 
        new Container (
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            children: [
              Text('Divisão Final!'),
          ],
        ),
      )
      )
    );
  }
}