import 'package:comanda_virtual_app/components/text_input.dart';
import 'package:comanda_virtual_app/models/cardapio.dart';
import 'package:comanda_virtual_app/models/pedido.dart';
import 'package:comanda_virtual_app/models/produto.dart';
import 'package:comanda_virtual_app/standalone_db.dart';
import 'package:flutter/material.dart';

Future<void> setUnitDialog(
    BuildContext context, Produto product, String curComandaID) async {
  final TextEditingController _controllerUnity = TextEditingController();

  var count = 0;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Novo Pedido "' + product.name + '".'),
        content: TextInput(
          'Quantidade:',
          () => {},
          hint: '',
          iconData: Icons.person,
          controller: _controllerUnity,
          keyBoardType: TextInputType.number,
          //mask: 'rg',
          autofocus: true,
        ),
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
            onPressed: () => {
              Navigator.popUntil(
                context,
                (route) => count++ == 2,
              ),
              StAloneDB.addNewAsk(
                curComandaID,
                Pedido(
                  Cardapio.getProductByID(product.id),
                  int.parse(_controllerUnity.text),
                ),
              ),
            },
            child: Text(
              'Fazer Pedido',
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
