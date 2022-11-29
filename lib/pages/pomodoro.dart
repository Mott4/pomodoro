import 'package:flutter/material.dart';
import 'package:pomodoro/components/entrada_tempo.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Pomodoro'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  titulo: 'Trabalho',
                  valor: 25,
                ),
                EntradaTempo(
                  titulo: 'Descanso',
                  valor: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
