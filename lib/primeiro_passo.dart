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
    var orangeColor     = new Color(0xFFF9AC18);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Racha conta', style: TextStyle(fontFamily: 'Poppins', color: new Color(0XFF3c3b40)),),
          backgroundColor: orangeColor,
          centerTitle: true,
        ),
        body: 
        new Container (
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            children: [
              /* PAGE TITLE */
              Text(
                'Primeiro passo:',
                style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
                textAlign: TextAlign.center
              ),

              Padding(padding: new EdgeInsets.fromLTRB(0.0,25.0,0.0,0.0,)),

              /* INFORMATIONS FORM */
              Form(
                key: form_primeiroPasso,
                child: Column(
                  children: <Widget>[

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
                      controller: quantidade_pessoas,
                      decoration: new InputDecoration(
                        hintText: 'Digite a quantidade de pessoas...', labelText: 'Quantidade de pessoas:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor informe a quantidade' : null;
                      }
                    ),

                    Padding(padding: new EdgeInsets.fromLTRB(0.0,15.0,0.0,0.0,)),

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
                      controller: taxa_servico,
                      decoration: new InputDecoration(
                        hintText: 'Digite a porcentagem de taxa de serviço...', labelText: 'Taxa de serviço (porcentagem)',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value.isEmpty) ? 'Por favor insira a porcentagem da taxa' : null;
                      }
                    ),

                    Padding(padding: new EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0,)),
                    
                    /* SEND INFORMATIONS BUTTON */
                    ButtonTheme(
                      minWidth: 230.0,
                      height: 60.0,
                      child: RaisedButton(
                        child: Text('Enviar', style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),),
                        color: orangeColor,
                        onPressed: () {
                          if (form_primeiroPasso.currentState.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SegundoPasso()),);
                          }
                        },
                      ),
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