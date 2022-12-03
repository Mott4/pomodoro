import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc; // incremento
  final void Function()? dec; // decremento

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.titulo,
          style: TextStyle(fontSize: 25, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: this.dec,
              child: Icon(Icons.arrow_downward),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(4),
                backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
              ),
            ),
            Text(
              '${this.valor} min',
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: this.inc,
                  child: Icon(Icons.arrow_upward),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4),
                    backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
