import 'package:campo_minado/features/campo_minado/data/models/tabuleiro_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Ganhar jogo", () {
    TabuleiroModel tab = TabuleiroModel(
      linhas: 2,
      colunas: 2,
      qtddeBombas: 0,
    );
    tab.campos[0].minar();
    tab.campos[3].minar();

    tab.campos[0].alterarMarcacao();
    tab.campos[1].abrir();
    tab.campos[2].abrir();
    tab.campos[3].alterarMarcacao();

    expect(tab.resolvido, isTrue);
  });
}
