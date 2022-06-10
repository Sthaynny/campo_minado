import 'package:campo_minado/features/campo_minado/data/models/campo_model.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final CampoModel campo;
  final void Function(CampoModel) onAbrir;
  final void Function(CampoModel) onAlterarMarcacao;

  const CampoWidget({
    Key? key,
    required this.campo,
    required this.onAbrir,
    required this.onAlterarMarcacao,
  }) : super(key: key);

  Widget _getImage() {
    int qtdMinas = campo.qtdeMinasNaVizinhaca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAbrir(campo);
      },
      onLongPress: () {
        onAlterarMarcacao(campo);
      },
      child: _getImage(),
    );
  }
}
