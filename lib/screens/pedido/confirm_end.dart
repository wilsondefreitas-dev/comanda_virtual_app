import 'package:flutter/material.dart';

Future<void> confirmEndDialog(BuildContext context, Function onConfirm) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Tem certeza que deseja fechar a comanda?'),
        content: Text('Todos os pedidos serão excluídos permanentemente.'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: 16.0),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () => {onConfirm()},
            child: Text(
              'Fechar Comanda',
              style: TextStyle(backgroundColor: Colors.green),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
        ],
      );
    },
  );
}
