import 'package:campo_minado/features/campo_minado/presentation/cubit/campo_minado_cubit.dart';
import 'package:campo_minado/features/campo_minado/presentation/screen/components/resultado.dart';
import 'package:campo_minado/features/campo_minado/presentation/screen/components/tabuleiro_widget.dart';
import 'package:campo_minado/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key key}) : super(key: key);

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider<CampoMinadoCubit>(
          create: (context) => dependency<CampoMinadoCubit>()..iniciar(),
          child: BlocBuilder<CampoMinadoCubit, CampoMinadoState>(
            builder: (context, state) {
              if (state is CampoMinadoInitial) {
                return Center(child: CircularProgressIndicator());
              }

              return Scaffold(
                appBar: ResultadoWidgets(
                  venceu: state.venceu,
                  onReiniciar:
                      BlocProvider.of<CampoMinadoCubit>(context).reiniciar,
                ),
                body: Container(
                  color: Colors.grey,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return TabuleiroWidget(
                        tabuleiro: BlocProvider.of<CampoMinadoCubit>(context)
                            .getTabuleiro(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        ),
                        onAbrir:
                            BlocProvider.of<CampoMinadoCubit>(context).abrir,
                        onAlterarMarcacao:
                            BlocProvider.of<CampoMinadoCubit>(context)
                                .alterarMarcacao,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
