import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.titulo,
          style: TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_downward),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(8),
                backgroundColor: Colors.red,
              ),
            ),
            Text(
              '${this.valor} min',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_upward),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                    backgroundColor: Colors.red,
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
