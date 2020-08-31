# Racha Conta 💰

* Descrição:
  * Trabalho de Laboratório de Desenvolvimento para Dispositivos Móveis.
  * Aplicação móvel desenvolvida em Dart e Flutter.
  
* Objetivo da aplicação:
  * dividir contas de bares entre amigos, calculando automáticamente valor de taxa de serviço, valor que cada um deve desembolsar e valor final do consumo.
  
* Entradas do usuário:
  * **Valor total de consumo**. Foi inserido um teclado numérico que não funciona em todos os emuladores então para evitar erros é importante que o usuário não insira valores com vírgula (exemplo: 150,59), mas apenas com ponto (exemplo: 150.59 - norma americana de formatação de moeda).
  * **Quantidade de pessoas**. Número pelo qual será dividida a conta.
  * **Porcentagem de taxa de serviço**. Importante ressaltar novamente que como o teclado numérico não funciona em todos os emuladores, o usuário não deve digitar o sinal de porcentagem '%', pois o código não trata a inserção de caracteres inválidos e irá apresentar erro.
  
* Saídas:
  * Valor individual (valor que cada um deverá pagar);
  * Valor total da taxa de serviço (em dinheiro);
  * Valor total consumido (valor total consumido + taxa).
  
* Versão da aplicação:
  * v.1.1

* Próximas atualizações:
  * Inserção da opção de dividir o valor pelo consumo individual de cada um, somando-se a taxa à este valor.
  
### Apresentação da aplicação 📱
* **Home** - primeira tela visualizada ao abrir-se a aplicação - tela de boas vindas.


![Home](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/home.PNG)


* **Tela de inserção das informações** - segunda tela da aplicação, onde o usuário deve inserir as entradas.


![Tela de inserção](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/consumo_total.PNG)


* **Tela de exibição do resultado** - Modal que roda na mesma tela de inserção, exibe os resultados obtidos.


![Tela de exibição](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/result.PNG)
