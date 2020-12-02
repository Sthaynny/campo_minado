import 'package:flutter/foundation.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtddeBombas;

  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.qtddeBombas,
  });
}
