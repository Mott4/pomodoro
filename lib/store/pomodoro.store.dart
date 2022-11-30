import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  // =============================================================== //
  //                           observáveis                           //
  // =============================================================== //

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  // =============================================================== //
  //     ações para incrementar e decrementar tempo  do pomodoro     //
  // =============================================================== //

  // tempo trabalho ====================================================
  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  // tempo descanso ====================================================
  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }
}
