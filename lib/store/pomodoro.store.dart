import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO }

abstract class _PomodoroStore with Store {
  // =============================================================== //
  //                           observáveis                           //
  // =============================================================== //

  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.TRABALHO;

  // =============================================================== //
  //     ações para incrementar e decrementar tempo  do pomodoro     //
  // =============================================================== //

  Timer? cronometro;

  // tempo iniciado ==========================================================
  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  // tempo parado ============================================================
  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  // tempo reiniciar =========================================================
  @action
  void reiniciar() {
    iniciado = false;
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  // tempo trabalho ==========================================================
  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      if (estaTrabalhando()) {
        reiniciar();
      }
    }
  }

  // tempo descanso ==========================================================
  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    // para impedir de colocar valor negativo no timer. Abaixo:
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaTrabalhando()) {
        reiniciar();
      }
    }
  }

  // função bool para enum =====================================================

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      minutos = tempoDescanso;
      tipoIntervalo = TipoIntervalo.TRABALHO;
    }
    segundos = 0;
  }
}
