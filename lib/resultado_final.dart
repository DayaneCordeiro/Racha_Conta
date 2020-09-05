import 'package:flutter/material.dart';
import 'models/pessoa.dart';

class ResultadoFinal extends StatefulWidget {
  final List<Pessoa> pessoas;
  final double taxa;
  final double taxa_dividida;
  final int quantidade_pessoas;

  ResultadoFinal(
      this.pessoas, this.taxa, this.taxa_dividida, this.quantidade_pessoas);

  @override
  _ResultadoFinalPageState createState() => _ResultadoFinalPageState();
}

class _ResultadoFinalPageState extends State<ResultadoFinal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
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
              Text(
                '💸\nEste é o resultado final:',
                style: TextStyle(fontFamily: 'Popins', fontSize: 22),
                textAlign: TextAlign.center,
              ),

              /* Espaçamento */
              Padding(
                padding: new EdgeInsets.fromLTRB(
                  0.0,
                  25.0,
                  0.0,
                  0.0,
                ),
              ),

              /* Valor total de taxa */
              Text(
                'Valor total de taxa de serviço: R\$${widget.taxa.toStringAsFixed(2)}\n\nValor da taxa para as ${widget.quantidade_pessoas} pessoas: R\$${widget.taxa_dividida.toStringAsFixed(2)}',
                style: TextStyle(fontFamily: 'Popins', fontSize: 15),
              ),

              /* Espaçamento */
              Padding(
                padding: new EdgeInsets.fromLTRB(
                  0.0,
                  25.0,
                  0.0,
                  0.0,
                ),
              ),

              /* Lista de pessoas */
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.pessoas.length,
                    itemBuilder: (BuildContext context, int index) {
                      /* Função que determina como os itens devem ser construidos na tela */
                      final pessoa = widget.pessoas[index];

                      return Text(
                          'Nome: ${pessoa.nome}\nValor consumido: ${pessoa.consumo.toStringAsFixed(2)}\n');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
