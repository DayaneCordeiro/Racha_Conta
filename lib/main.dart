import 'package:flutter/material.dart';
import 'consumo_total.dart';
import 'taxa_servico.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Racha Conta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  /* Variáveis */
  var nameController = TextEditingController();
  var consumoController = TextEditingController();
  var orange = new Color(0xFFF9AC18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Racha Conta 💰',
            style: TextStyle(
              fontFamily: 'Popins',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(children: <Widget>[
          /* Título da página */
          Padding(
            padding: new EdgeInsets.fromLTRB(
              40.0,
              90.0,
              40.0,
              40.0,
            ),
            child: Text('Como você gostaria de dividir a conta?',
                style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
                textAlign: TextAlign.center),
          ),

          /* Botão do cálculo igual para todos */
          ButtonTheme(
            minWidth: 230.0,
            height: 60.0,
            child: RaisedButton(
              child: Text(
                'Mesmo valor para todos',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Popins',
                ),
              ),
              color: orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsumoTotal(),
                  ),
                );
              },
            ),
          ),

          /* Sparação entre os botões */
          Padding(
              padding: new EdgeInsets.fromLTRB(
            0.0,
            0.0,
            0.0,
            40.0,
          )),

          /* Botão do cálculo igual para todos */
          ButtonTheme(
            minWidth: 230.0,
            height: 60.0,
            child: RaisedButton(
              child: Text(
                'Pelo consumo individual',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Popins',
                ),
              ),
              color: orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaxaServico(),
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
