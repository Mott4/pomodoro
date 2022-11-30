import 'package:flutter/material.dart';
import 'package:pomodoro/pages/pomodoro.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import './store/pomodoro.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //==================================================================================================
    // * Então, para consumir nossa PomodoroStore, precisamos importar o provider(nesse caso)
    // onde iremos utilizar. Aqui, no main.dart, vamos usar o MultiProvider para criar nosso "provedor".
    //
    // * Esse MultiProvider acompanha de um providers que recebe um array [] e em seguida,
    // colocamos nossa STORE dentro dele e passando via Generics<>.
    // Lembrando que nessa array, podemos colocar mais de uma STORE.
    //
    //  * Segue abaixo:
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(), // método que vai devolver a nossa STORE
        ),
      ],
      child: MaterialApp(
        title: 'Pomodoro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PomodoroPage(),
      ),
    );
  }
}

// ============================================================================================== //
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:pomodoro/store/contador.store.dart';

//==============================
// Aqui eu guardo a minha store.
//==============================
// final store = ContadorStore();

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contador'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),

//================================================================================
// Adiciono um Observer para colocar a minha ação aqui dentro, com sua reatividade
//================================================================================
//       Observer(
//         builder: ((_) => Text(
//               '${store.contador}',
//               style: Theme.of(context).textTheme.headline4,
//             )),
//       ),
//     ],
//   ),
// ),

//=======================================================================================
// Então, aqui nesse botão eu passo o incremento criado na Store, que posteriormente ele
// vai estar modificando o valor do nosso @observable.
// Chamando a seguinde linha: store.incrementar
//=======================================================================================
//       floatingActionButton: FloatingActionButton(
//         onPressed: store.incrementar,
//         tooltip: 'Incrementar',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
