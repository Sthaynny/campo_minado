import 'package:campo_minado/core/exceptions/explosao_exceptin.dart';
import 'package:campo_minado/features/campo_minado/domain/entities/campo.dart';

class CampoModel extends Campo {
  CampoModel({
    required int linha,
    required int coluna,
  }) : super(coluna: coluna, linha: linha);

  final List<Campo> vizinhos = [];
  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();
    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhacaSegura) {
      vizinhos.forEach(abrirCampo);
    }
  }

  void abrirCampo(Campo value) {
    (value as CampoModel).abrir();
  }

  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alterarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEmarcado = _minado && _marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEmarcado || seguroEAberto;
  }

  bool get vizinhacaSegura {
    return vizinhos.every((v) => !(v as CampoModel)._minado);
  }

  int get qtdeMinasNaVizinhaca {
    return vizinhos.where((v) => (v as CampoModel).minado).length;
  }
}
