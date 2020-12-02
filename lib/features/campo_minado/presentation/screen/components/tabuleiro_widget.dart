import 'package:campo_minado/features/campo_minado/data/models/campo_model.dart';
import 'package:campo_minado/features/campo_minado/data/models/tabuleiro_model.dart';
import 'package:campo_minado/features/campo_minado/presentation/screen/components/campo_widget.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final TabuleiroModel tabuleiro;
  final void Function(CampoModel) onAbrir;
  final void Function(CampoModel) onAlterarMarcacao;
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
