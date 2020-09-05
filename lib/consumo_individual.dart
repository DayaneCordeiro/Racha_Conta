import 'package:flutter/material.dart';
import 'models/pessoa.dart';
import 'resultado_final.dart';

class ConsumoIndividual extends StatefulWidget {
  final double taxa;

  ConsumoIndividual(this.taxa);
  var pessoas = new List<Pessoa>();

  ConsumoIndividualPage() {
    pessoas = [];
  }

  @override
  _ConsumoIndividualPageState createState() => _ConsumoIndividualPageState();
}

class _ConsumoIndividualPageState extends State<ConsumoIndividual> {
  var nomeController = TextEditingController();
  var consumoController = TextEditingController();

  /// @brief Recupera o valor dos controllers e cria uma nova pessoa
  void add() {
    if (nomeController.text.isEmpty || consumoController.text.isEmpty) return;

    setState(() {
      widget.pessoas.add(
        Pessoa(
          nome: nomeController.text,
          consumo: double.parse(consumoController.text),
        ),
      );
      nomeController.clear();
      consumoController.clear();
    });
  }

  /// @brief Remove uma determinada tarefa quando ela é arrastada pro lado
  void remove(int index) {
    setState(() {
      widget.pessoas.removeAt(index);
    });
  }

  /// @brief Calcula o total e exibe na tela
  double calcular() {
    List<Pessoa> result = [];
    double total = 0;

    if (widget.pessoas.isNotEmpty) {
      widget.pessoas.forEach((element) {
        total += element.consumo;
      });

      return total;
    }
    return 0;
  }

  ///@brief Retorna o número de pessoas da lista
  int somarPessoas() {
    return widget.pessoas.length;
  }

  ///@brief Adiciona a taxa divida entre todos no valor individual de cada um
  void adicionarTaxa(double valor) {
    if (widget.pessoas.isNotEmpty) {
      widget.pessoas.forEach((element) {
        element.consumo += valor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double taxa = widget.taxa;

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
                'Cadastre as pessoas 😝\n(para apagar basta arrastar para o lado) e depois clique em calcular',
                style: TextStyle(fontFamily: 'Popins', fontSize: 20),
                textAlign: TextAlign.center,
              ),
              /* Input nome */
              TextFormField(
                controller: nomeController,
                decoration: new InputDecoration(
                  hintText: 'Digite o nome...',
                  labelText: 'Nome',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  return (value.isEmpty) ? 'Por favor insira um valor' : null;
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),

              /* Input consumo pessoal */
              TextFormField(
                controller: consumoController,
                decoration: new InputDecoration(
                  hintText: 'Digite o valor consumido...',
                  labelText: 'Valor consumido',
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
                  25.0,
                  0.0,
                  0.0,
                ),
              ),

              /* Botão de cadastrar pessoa */
              FloatingActionButton(
                onPressed: add,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),

              /* Espaçamento */
              Padding(
                padding: new EdgeInsets.fromLTRB(
                  0.0,
                  35.0,
                  0.0,
                  0.0,
                ),
              ),

              /* Botão de cálcular */
              ButtonTheme(
                minWidth: 230.0,
                height: 60.0,
                child: RaisedButton(
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Popins',
                    ),
                  ),
                  color: Colors.orange,
                  onPressed: () {
                    double total = calcular();
                    double taxa_total = total * (taxa / 100);
                    int quantidade_pessoas = somarPessoas();

                    if (quantidade_pessoas == 0) {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Atenção:'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Cadastre pelo menos uma pessoa!'),
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
                    } else {
                      double taxa_dividida = taxa_total / quantidade_pessoas;
                      adicionarTaxa(taxa_dividida);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultadoFinal(widget.pessoas,
                              taxa_total, taxa_dividida, quantidade_pessoas),
                        ),
                      );
                    }
                  },
                ),
              ),

              /* Espaçamento */
              Padding(
                padding: new EdgeInsets.fromLTRB(
                  0.0,
                  35.0,
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

                    return Dismissible(
                      child: Text(
                          'Nome: ${pessoa.nome}\nValor consumido: ${pessoa.consumo.toStringAsFixed(2)}\n'),
                      key: Key(pessoa.nome),
                      background: Container(
                        color: Colors.redAccent.withOpacity(0.2),
                      ),
                      onDismissed: (direction) {
                        remove(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
