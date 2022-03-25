class HomeController {
  final List<int> _tabuleiro =
      List.generate(9, (_) => 0);

  int _jogadorVez = 1;

  void jogar(int index) {
    _tabuleiro[index] = _jogadorVez;
    _jogadorVez = _jogadorVez % 2 == 0 ? 1 : 2;
  }

  int getValorPoisicao(int index) {
    return _tabuleiro[index];
  }

  int get tabluleiroLength => _tabuleiro.length;
}
