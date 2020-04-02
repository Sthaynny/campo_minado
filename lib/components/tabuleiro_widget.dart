import 'package:campo_minado/components/campo_widget.dart';
import 'package:flutter/material.dart';

import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;
  const TabuleiroWidget({
    Key key,
    this.tabuleiro,
    this.onAbrir,
    this.onAlterarMarcacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c) {
          return CampoWidget(
              campo: c, onAbrir: onAbrir, onAlterarMarcacao: onAlterarMarcacao);
        }).toList(),
      ),
    );
  }
}
