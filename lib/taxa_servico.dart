import 'package:flutter/material.dart';
import 'consumo_individual.dart';

class TaxaServico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Racha Conta',
      debugShowCheckedModeBanner: false,
      /* remove aquela tirinha de debug que fica na tela */
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TaxaServicoPage(),
    );
  }
}

class TaxaServicoPage extends StatefulWidget {
  @override
  _TaxaServicoPageState createState() => _TaxaServicoPageState();
}

class _TaxaServicoPageState extends State<TaxaServicoPage> {
  var taxaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* AppBar */
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

      /* Body */
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            /* Título da página */
            Padding(
              padding: new EdgeInsets.fromLTRB(
                0.0,
                30.0,
                0.0,
                40.0,
              ),
              child: Text(
                  'Primeiro nos informe a porcentagem taxa de serviço\n(apenas números):',
                  style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
                  textAlign: TextAlign.center),
            ),

            /* Input nome */
            TextFormField(
              controller: taxaController,
              decoration: new InputDecoration(
                hintText: 'Digite a porcentagem...',
                labelText: 'Taxa de serviço',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                return (value.isEmpty) ? 'Por favor insira um valor' : null;
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),

            /* Espaçamento */
            Padding(
              padding: new EdgeInsets.fromLTRB(
                0.0,
                45.0,
                0.0,
                0.0,
              ),
            ),

            /* Botão que envia os dados */
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
                color: Colors.orange,
                onPressed: () {
                  if (taxaController.value.text.isNotEmpty) {
                    double taxa = double.parse(taxaController.value.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsumoIndividual(taxa),
                      ),
                    );
                  } else {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Atenção:'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('O campo Taxa de serviço é obrigatório!'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
