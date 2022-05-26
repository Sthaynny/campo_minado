part of 'campo_minado_cubit.dart';

abstract class CampoMinadoState {
  CampoMinadoState({this.venceu, this.tabuleiro});
  final bool? venceu;
  final TabuleiroModel? tabuleiro;
}

class CampoMinadoInitial extends CampoMinadoState {}

class CampoMinadoCarregado extends CampoMinadoState {
  CampoMinadoCarregado({bool? venceu, TabuleiroModel? tabuleiro})
      : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoFinishVictory extends CampoMinadoState {
  CampoMinadoFinishVictory({
    bool? venceu,
    TabuleiroModel? tabuleiro,
  }) : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoFinishFailure extends CampoMinadoState {
  CampoMinadoFinishFailure({
    bool? venceu,
    TabuleiroModel? tabuleiro,
  }) : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoRestart extends CampoMinadoState {
  CampoMinadoRestart({
    bool? venceu,
    TabuleiroModel? tabuleiro,
  }) : super(tabuleiro: tabuleiro, venceu: venceu);
}
