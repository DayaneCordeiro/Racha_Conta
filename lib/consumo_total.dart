import 'package:flutter/material.dart';

class ConsumoTotal extends StatefulWidget {
  @override
  ConsumoTotalState createState() => ConsumoTotalState();
}

class ConsumoTotalState extends State<ConsumoTotal> {
  /* CONTROLLERS */
  final form_consumo = GlobalKey<FormState>();
  final total_value = TextEditingController();
  final total_people = TextEditingController();
  final total_service_charge = TextEditingController();

  @override
  void dispose() {
    total_value.dispose();
    total_people.dispose();
    total_service_charge.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orangeColor = new Color(0xFFF9AC18);
    double total = 0;
    double custo = 0;
    int pessoas = 0;
    double taxa = 0;
    double total_individual = 0;
    double total_taxa = 0;
    String result;
    String result_taxa;
    String result_individual;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
            /* Função que preenche os espaços da tela, barra de cima... */
            appBar: AppBar(
              title: Text(
                'Racha conta',
                style: TextStyle(
                    fontFamily: 'Poppins', color: new Color(0XFF3c3b40)),
              ),
              backgroundColor: new Color(0xFFF9AC18),
              centerTitle: true,
            ),
            body: new Container(
              padding: const EdgeInsets.all(40.0),
              child: new Column(
                children: [
                  /* PAGE TITLE */
                  Text('Vamos Dividir!',
                      style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
                      textAlign: TextAlign.center),

                  /* DIVSION FORM */
                  Form(
                      key: form_consumo,
                      child: Column(
                        children: <Widget>[
                          /* MONEY ICON */
                          Container(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.green,
                              size: 24,
                            ),
                          ),

                          /* INPUT TOTAL VALUE */
                          TextFormField(
                              controller: total_value,
                              decoration: new InputDecoration(
                                hintText: 'Digite o valor...',
                                labelText: 'Valor Total de consumo',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return (value.isEmpty)
                                    ? 'Por favor insira um valor'
                                    : null;
                              }),
                          Padding(
                              padding: new EdgeInsets.fromLTRB(
                            0.0,
                            15.0,
                            0.0,
                            0.0,
                          )),

                          /* PEOPLE ICON */
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              Icons.insert_emoticon,
                              color: Colors.blue,
                              size: 24,
                            ),
                          ),

                          /* INPUT AMOUNT OF PEOPLE */
                          TextFormField(
                              controller: total_people,
                              decoration: new InputDecoration(
                                hintText: 'Digite a quantidade...',
                                labelText: 'Quantidade de pessoas',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return (value.isEmpty)
                                    ? 'Por favor insira a quantidade'
                                    : null;
                              }),
                          Padding(
                              padding: new EdgeInsets.fromLTRB(
                            0.0,
                            15.0,
                            0.0,
                            0.0,
                          )),

                          /* SERVICE CHARGE ICON */
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              Icons.local_bar,
                              color: Colors.pink,
                              size: 24,
                            ),
                          ),

                          /* INPUT SERVICE CHARGE */
                          TextFormField(
                              controller: total_service_charge,
                              decoration: new InputDecoration(
                                hintText: 'Apenas números...',
                                labelText: 'Porcentagem de taxa de serviço',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return (value.isEmpty)
                                    ? 'Por favor insira a taxa'
                                    : null;
                              }),
                          Padding(
                              padding: new EdgeInsets.fromLTRB(
                            0.0,
                            20.0,
                            0.0,
                            0.0,
                          )),

                          /* CALCULATE BUTTON */
                          ButtonTheme(
                            minWidth: 230.0,
                            height: 60.0,
                            child: RaisedButton(
                              child: Text(
                                'Calcular',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins'),
                              ),
                              color: orangeColor,
                              onPressed: () {
                                if (form_consumo.currentState.validate()) {
                                  custo = double.parse(total_value.text);
                                  pessoas = int.parse(total_people.text);
                                  taxa =
                                      double.parse(total_service_charge.text);

                                  total_taxa = custo * (taxa / 100);
                                  total = custo + total_taxa;
                                  total_individual =
                                      (custo + total_taxa) / pessoas;

                                  result_individual =
                                      total_individual.toStringAsFixed(2);
                                  result_taxa = total_taxa.toStringAsFixed(2);
                                  result = total.toStringAsFixed(2);

                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Total:'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  '* Valor individual: R\u0024$result_individual\n* Taxa de serviço: R\u0024$result_taxa\n* Valor total: R\u0024$result'),
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
                      ))
                ],
              ),
            )));
  }
}
