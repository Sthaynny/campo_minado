import 'package:campo_minado/features/campo_minado/campo_minado_injection.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

void init() {
  final CampoMinadoContainer campoMinadoInjection = CampoMinadoContainer();

  campoMinadoInjection(dependency);
}
