import 'package:flutter/material.dart';
import 'consumo_individual.dart';
void main() => runApp(SegundoPasso());

class SegundoPasso extends StatefulWidget {
  @override
  SegundoPassoState createState() => SegundoPassoState();
}

class SegundoPassoState extends State<SegundoPasso> {
  final form_segundoPasso  = GlobalKey<FormState>();
  final nome                = TextEditingController();
  final consumo             = TextEditingController();

  @override
  void dispose() {
    nome.dispose();
    consumo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              Text('Segundo passo:'),
              Text('Cadastre a pessoa '),
              Form(
                key: form_segundoPasso,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nome,
                      decoration: new InputDecoration(
                        hintText: 'Digite o nome...', labelText: 'Nome:',
                      ),
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor informe um nome' : null;
                      }
                    ),
                    TextFormField(
                      controller: consumo,
                      decoration: new InputDecoration(
                        hintText: 'Digite o valor consumido...', labelText: 'Valor de consumo',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira o valor consumido' : null;
                      }
                    ),
                    RaisedButton(
                      child: Text('Cadastrar'),
                      onPressed: () {
                        if (form_segundoPasso.currentState.validate())
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ConsumoIndividual()),);
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