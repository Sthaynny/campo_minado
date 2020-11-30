import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campo_minado_state.dart';

class CampoMinadoCubit extends Cubit<CampoMinadoState> {
  CampoMinadoCubit() : super(CampoMinadoInitial());
}
