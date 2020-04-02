import 'package:campo_minado/components/resultado.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exceptin.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key key}) : super(key: key);

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro;

  _reiniciar() {
    setState(() {
      _tabuleiro.reiniciar();
      _venceu = null;
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _alterarMarcacao(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      campo.alterarMarcacao();
      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();
      return _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtddeBombas: 10,
      );
    } else {
      return _tabuleiro;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: ResultadoWidgets(
            venceu: _venceu,
            onReiniciar: _reiniciar,
          ),
          body: Container(
            color: Colors.grey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return TabuleiroWidget(
                  tabuleiro: _getTabuleiro(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  ),
                  onAbrir: _abrir,
                  onAlterarMarcacao: _alterarMarcacao,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
