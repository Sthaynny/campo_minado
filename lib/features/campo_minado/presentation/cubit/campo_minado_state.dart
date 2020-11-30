part of 'campo_minado_cubit.dart';

@immutable
abstract class CampoMinadoState {
  CampoMinadoState({@required this.venceu, @required this.tabuleiro});
  final bool venceu;
  final TabuleiroModel tabuleiro;
}

class CampoMinadoInitial extends CampoMinadoState {}

class CampoMinadoCarregado extends CampoMinadoState {
  CampoMinadoCarregado(
      {@required bool venceu, @required TabuleiroModel tabuleiro})
      : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoFinishVictory extends CampoMinadoState {
  CampoMinadoFinishVictory(
      {@required bool venceu, @required TabuleiroModel tabuleiro})
      : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoFinishFailure extends CampoMinadoState {
  CampoMinadoFinishFailure(
      {@required bool venceu, @required TabuleiroModel tabuleiro})
      : super(tabuleiro: tabuleiro, venceu: venceu);
}

class CampoMinadoRestart extends CampoMinadoState {
  CampoMinadoRestart(
      {@required bool venceu, @required TabuleiroModel tabuleiro})
      : super(tabuleiro: tabuleiro, venceu: venceu);
}
