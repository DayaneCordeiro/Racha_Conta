import 'package:flutter/material.dart';
import 'segundo_passo.dart';
void main() => runApp(PrimeiroPasso());

class PrimeiroPasso extends StatefulWidget {
  @override
  PrimeiroPassoState createState() => PrimeiroPassoState();
}

class PrimeiroPassoState extends State<PrimeiroPasso> {
  final form_primeiroPasso  = GlobalKey<FormState>();
  final quantidade_pessoas  = TextEditingController();
  final taxa_servico        = TextEditingController();

  @override
  void dispose() {
    quantidade_pessoas.dispose();
    taxa_servico.dispose();
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
              Text('Primeiro passo:'),
              Form(
                key: form_primeiroPasso,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: quantidade_pessoas,
                      decoration: new InputDecoration(
                        hintText: 'Digite a quantidade de pessoas...', labelText: 'Quantidade de pessoas:',
                      ),
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor informe a quantidade' : null;
                      }
                    ),
                    TextFormField(
                      controller: taxa_servico,
                      decoration: new InputDecoration(
                        hintText: 'Digite a porcentagem de taxa de serviço...', labelText: 'Taxa de serviço',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira a porcentagem da taxa' : null;
                      }
                    ),
                    RaisedButton(
                      child: Text('Enviar'),
                      onPressed: () {
                        if (form_primeiroPasso.currentState.validate())
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SegundoPasso()),);
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