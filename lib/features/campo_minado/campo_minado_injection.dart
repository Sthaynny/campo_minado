import 'package:campo_minado/features/campo_minado/presentation/cubit/campo_minado_cubit.dart';
import 'package:get_it/get_it.dart';

class CampoMinadoContainer {
  void call(GetIt dependecy) {
    dependecy.registerFactory(() => CampoMinadoCubit());
  }
}
