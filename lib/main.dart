import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/contador.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

//==============================
// Aqui eu guardo a minha store.
//==============================
final store = ContadorStore();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            //================================================================================
            // Adiciono um Observer para colocar a minha ação aqui dentro, com sua reatividade
            //================================================================================
            Observer(
              builder: ((_) => Text(
                    '${store.contador}',
                    style: Theme.of(context).textTheme.headline4,
                  )),
            ),
          ],
        ),
      ),

      //=======================================================================================
      // Então, aqui nesse botão eu passo o incremento criado na Store, que posteriormente ele
      // vai estar modificando o valor do nosso @observable.
      // Chamando a seguinde linha: store.incrementar
      //=======================================================================================
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementar,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
