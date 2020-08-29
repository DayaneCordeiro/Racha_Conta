import 'package:flutter/material.dart';
void main() => runApp(ConsumoTotal());

class ConsumoTotal extends StatefulWidget {
  @override
  ConsumoTotalState createState() => ConsumoTotalState();
}

class ConsumoTotalState extends State<ConsumoTotal> {
  final form_consumo = GlobalKey<FormState>();
  final total_value  = TextEditingController();

  @override
  void dispose() {
    total_value.dispose();
    super.dispose();
  }

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
              Text('Vamos dividir!'),
              Form(
                key: form_consumo,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: total_value,
                      decoration: new InputDecoration(
                        hintText: 'Digite o valor...', labelText: 'Valor Total',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira um valor' : null;
                      }
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Digite a quantidade...', labelText: 'Quantidade de pessoas',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira a quantidade' : null;
                      }
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Digite a taxa...', labelText: 'Taxa de serviço',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira a taxa' : null;
                      }
                    ),
                    RaisedButton(
                      child: Text('Calcular'),
                      onPressed: () {
                        if (form_consumo.currentState.validate())
                          print(total_value.text);
                      },
                    ),
                  ],
                )
            )
          ],
        ),
      )
      )
    );
  }
}