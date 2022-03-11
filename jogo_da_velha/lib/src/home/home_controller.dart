class HomeController {
  final List<List<int>> _tabuleiro =
      List.generate(3, (_) => List.generate(3, (_) => 0));

  int _jogadorVez = 1;

  void jogar(int linha, int coluna) {
    _tabuleiro[linha][coluna] = _jogadorVez;
    _jogadorVez = _jogadorVez % 2 == 0 ? 1 : 2;
  }

  int obtemValorPosicao(int linha, int coluna) {
    return _tabuleiro[linha][coluna];
  }
}
