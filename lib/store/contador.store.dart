import 'package:mobx/mobx.dart';

//==================================================================
// arquivo (que tem o mesmo nome que essa Store) a ter código gerado
// automaticamente e que não precisamos muito nos preocupar com ele.
//==================================================================
part 'contador.store.g.dart';

class ContadorStore = _ContadorStore with _$ContadorStore;

abstract class _ContadorStore with Store {
//====================================================================
// @observable é o nosso int, no caso do MobX. Onde guardamos um valor
//====================================================================
  @observable
  int contador = 0;

//===========================================================================
// @action é onde vamos criar a nossa ação, que nesse caso é um incremento.
// mas essa ação precisa ser passada no arquivo onde tivermos algo para ser
// pressionado ou animado.
// Por isso o MobX é o chamado de "Ação e Reação". Porque ele nos notifica de
// tal ação e executa o que precisa ser modificado.
//===========================================================================
  @action
  void incrementar() {
    contador++;
  }
}
