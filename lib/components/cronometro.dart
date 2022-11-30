import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // =============================================================== //
          //                           Cronometro                            //
          // =============================================================== //
          Text(
            'Hora de Estudar',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 100,
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 12),

          // =============================================================== //
          //                Botões Iniciar, Parar e Reiniciar                //
          // =============================================================== //

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CronometroBotao(
                  texto: 'Iniciar',
                  icone: Icons.play_arrow,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 20),
              //   child: CronometroBotao(
              //     texto: 'Parar',
              //     icone: Icons.stop,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CronometroBotao(
                  texto: 'Reiniciar',
                  icone: Icons.refresh,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
