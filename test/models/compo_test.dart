import 'package:campo_minado/features/campo_minado/data/models/campo_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('CampoModel', () {
    test("Abrir CampoModel COM Explosão", () {
      CampoModel c = CampoModel(
        linha: 0,
        coluna: 0,
      );
      c.minar();

      expect(c.abrir, throwsException);
    });

    test("Abrir CampoModel Sem Explosão", () {
      CampoModel c = CampoModel(
        linha: 0,
        coluna: 0,
      );
      c.abrir();

      expect(c.aberto, isTrue);
    });

    test("Adicionar NÃO vizinho", () {
      CampoModel c1 = CampoModel(linha: 0, coluna: 0);
      CampoModel c2 = CampoModel(linha: 1, coluna: 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test("Adicionar vizinho", () {
      CampoModel c1 = CampoModel(linha: 3, coluna: 3);
      CampoModel c2 = CampoModel(linha: 3, coluna: 4);
      CampoModel c3 = CampoModel(linha: 2, coluna: 2);
      CampoModel c4 = CampoModel(linha: 4, coluna: 4);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.vizinhos.length, 3);
    });
    test("minas na vizinhaca", () {
      CampoModel c1 = CampoModel(linha: 3, coluna: 3);
      CampoModel c2 = CampoModel(linha: 3, coluna: 4);
      c2.minar();
      CampoModel c3 = CampoModel(linha: 2, coluna: 2);
      CampoModel c4 = CampoModel(linha: 4, coluna: 4);
      c4.minar();
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.qtdeMinasNaVizinhaca, 2);
    });
  });
}
