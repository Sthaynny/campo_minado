import 'package:bloc/bloc.dart';
import 'package:campo_minado/core/exceptions/explosao_exceptin.dart';
import 'package:campo_minado/features/campo_minado/data/models/campo_model.dart';
import 'package:campo_minado/features/campo_minado/data/models/tabuleiro_model.dart';

part 'campo_minado_state.dart';

class CampoMinadoCubit extends Cubit<CampoMinadoState> {
  CampoMinadoCubit() : super(CampoMinadoInitial());

  void iniciar() {
    emit(CampoMinadoCarregado(venceu: null, tabuleiro: null));
  }

  void abrir(CampoModel campo) {
    if (state.venceu == null) {
      try {
        campo.abrir();
        if (state.tabuleiro != null && state.tabuleiro!.resolvido) {
          emit(CampoMinadoFinishVictory(
              venceu: true, tabuleiro: state.tabuleiro));
        }
      } on ExplosaoException {
        state.tabuleiro?.revelarBombas();
        emit(CampoMinadoFinishVictory(
            venceu: false, tabuleiro: state.tabuleiro));
      }
    }
  }

  void reiniciar() {
    state.tabuleiro?.reiniciar();
    emit(CampoMinadoRestart(venceu: null, tabuleiro: state.tabuleiro));
  }

  void alterarMarcacao(CampoModel campo) {
    if (state.venceu == null) {
      campo.alterarMarcacao();

      if (state.tabuleiro != null && state.tabuleiro!.resolvido) {
        emit(
            CampoMinadoFinishVictory(venceu: true, tabuleiro: state.tabuleiro));
      }
    }
  }

  TabuleiroModel getTabuleiro(double largura, double altura) {
    if (state.tabuleiro != null) {
      if (state.venceu == null) {
        emit(CampoMinadoCarregado(
          venceu: state.venceu,
          tabuleiro: state.tabuleiro,
        ));
      }
      return state.tabuleiro!;
    } else {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();
      TabuleiroModel tab = TabuleiroModel(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtddeBombas: 10,
      );
      if (state.venceu == null) {
        emit(CampoMinadoCarregado(venceu: state.venceu, tabuleiro: tab));
      }
      return tab;
    }
  }
}
