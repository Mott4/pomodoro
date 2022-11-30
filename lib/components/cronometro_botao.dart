import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;

  const CronometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final store = Provider.of<PomodoroStore>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icone, size: 30),
          ),
          Text(
            texto,
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
