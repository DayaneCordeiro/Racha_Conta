# Racha Conta 💰

* Link para o vídeo com a apresentação da aplicação:
 * https://reccloud.com/pt/u/npfzxyq

* Descrição:
  * Trabalho de Laboratório de Desenvolvimento para Dispositivos Móveis.
  * Aplicação móvel desenvolvida em Dart e Flutter.
  
* Objetivo da aplicação:
  * dividir contas de bares entre amigos, calculando automáticamente valor de taxa de serviço, valor que cada um deve desembolsar e valor final do consumo. Na versão 2.0, a tela principal foi alterada para permitir que haja divisão pelo consumo individual também.
  
* **Entradas do usuário:**
  * Na tela de consumo total:
    * **Valor total de consumo**. Foi inserido um teclado numérico que não funciona em todos os emuladores então para evitar erros é importante que o usuário não insira valores com vírgula (exemplo: 150,59), mas apenas com ponto (exemplo: 150.59 - norma americana de formatação de moeda).
    * **Quantidade de pessoas**. Número pelo qual será dividida a conta.
    * **Porcentagem de taxa de serviço**. Importante ressaltar novamente que como o teclado numérico não funciona em todos os emuladores, o usuário não deve digitar o sinal de porcentagem '%', pois o código não trata a inserção de caracteres inválidos e irá apresentar erro.
  * **Na tela de consumo individual:**
    * **Taxa de serviço**.
    * **Nome**. Nome de cada uma das pessoas que devem entrar na listagem.
    * **Valor consumido**. valor consumido por cada pessoa.
  
* Saídas:
  * Valor individual (valor que cada um deverá pagar);
  * Valor total da taxa de serviço (em dinheiro);
  * Valor total consumido (valor total consumido + taxa);
  * Valor dividido da taxa de serviço (apenas para consumo individual).
  
* Versão da aplicação:
  * v.2.1

* Próximas atualizações:
  * Melhorias na apresentação (layout) do aplicativo.
  
### Apresentação da aplicação 📱
* **Home** - primeira tela visualizada ao abrir-se a aplicação - tela de boas vindas.


![Home](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/main.PNG)


* **Tela de inserção das informações** - segunda tela da aplicação, onde o usuário deve inserir as entradas.


![Tela de inserção](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/cadastrar_total.PNG)


* **Tela de exibição do resultado** - Modal que roda na mesma tela de inserção, exibe os resultados obtidos.


![Tela de exibição](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/resultado_total.PNG)


* **Tela de inserção de taxa de serviço** - Quando clicado em dividir pelo consumo individual


![Tela de inserção de taxa de serviço](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/taxa_servico.PNG)


* **Tela de cadastro de pessoas** - Cadastrar e excluir pessoas da lista de divisão


![Cadastro de pessoas](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/cadastrar_pessoas.PNG)


* **Tela de resultado final** - Para demonstrar o resultado final da divisão pelo consumo individual.


![Resultado final](https://github.com/DayaneCordeiro/Racha_Conta/blob/master/images/resultado_individual.PNG)
