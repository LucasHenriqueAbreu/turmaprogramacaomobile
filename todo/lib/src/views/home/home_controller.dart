class HomeController {
  List<String> tarefas = [
    'Lavar a louça',
    'Fazer trabalho',
    'Lavar a roupa',
    'Pagar boleto'
  ];

  void addTarefa(String descricao) {
    tarefas.add(descricao);
  }
}
