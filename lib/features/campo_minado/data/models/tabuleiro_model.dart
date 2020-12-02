import 'dart:math';

import 'package:campo_minado/features/campo_minado/data/models/campo_model.dart';
import 'package:campo_minado/features/campo_minado/domain/entities/tabuleiro.dart';
import 'package:flutter/foundation.dart';

class TabuleiroModel extends Tabuleiro {
  final List<CampoModel> _campos = [];

  TabuleiroModel({
    @required int linhas,
    @required int colunas,
    @required int qtddeBombas,
  }) : super(linhas: linhas, colunas: colunas, qtddeBombas: qtddeBombas) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  void reiniciar() {
    _campos.forEach((c) => c.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    _campos.forEach((c) => c.revelarBomba());
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(CampoModel(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    if (qtddeBombas > linhas * colunas) return;
    while (sorteadas < qtddeBombas) {
      int i = Random().nextInt(_campos.length);
      if (!_campos[i].minado) {
        sorteadas++;
        _campos[i].minar();
      }
    }
  }

  List<CampoModel> get campos {
    return _campos;
  }

  bool get resolvido {
    return _campos.every((c) => c.resolvido);
  }
}
