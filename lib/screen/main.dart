import 'package:flutter/material.dart';
import 'consumo_total.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orangeColor = new Color(0xFFF9AC18);

    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Racha conta',
          style: TextStyle(fontFamily: 'Poppins', color: new Color(0XFF3c3b40)),
        ),
        backgroundColor: orangeColor,
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        /* PAGE TITLE */
        Padding(
          padding: new EdgeInsets.fromLTRB(
            40.0,
            150.0,
            40.0,
            45.0,
          ),
          child: Text('Seja bem vindo ao Racha Conta 😎!',
              style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
              textAlign: TextAlign.center),
        ),

        /* COMMON DIVISION */
        ButtonTheme(
          minWidth: 230.0,
          height: 60.0,
          child: RaisedButton(
              child: Text(
                'Dividir minha conta',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              ),
              color: orangeColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsumoTotal()),
                );
              }),
        ),
        Padding(
            padding: new EdgeInsets.fromLTRB(
          0.0,
          0.0,
          0.0,
          40.0,
        )),
      ]),
    );
  }
}
