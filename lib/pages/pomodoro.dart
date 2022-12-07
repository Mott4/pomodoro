import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Cronometro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntradaTempo(
                      titulo: 'Trabalho',
                      valor: store.tempoTrabalho,

                      //======================================================================================//
                      // Teste para caso o cronometro estiver iniciado e estiver trabalhando/descansando,     //
                      // os botões irão ficar transparentes e não poderemos utiliza-los enquanto o cronometro //
                      // estiver rodando.                                                                     //
                      //======================================================================================//
                      inc: store.iniciado && store.estaTrabalhando() ? null : store.incrementarTempoTrabalho,
                      dec: store.iniciado && store.estaTrabalhando() ? null : store.decrementarTempoTrabalho,
                    ),
                    EntradaTempo(
                      titulo: 'Descanso',
                      valor: store.tempoDescanso,
                      inc: store.iniciado && store.estaDescansando() ? null : store.incrementarTempoDescanso,
                      dec: store.iniciado && store.estaDescansando() ? null : store.decrementarTempoDescanso,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
