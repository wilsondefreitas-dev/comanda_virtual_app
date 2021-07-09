import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/models/pedido.dart';
import 'package:flutter/material.dart';

class EditUnitDialog extends StatefulWidget {
  final Pedido pedido;
  final Comanda comanda;

  EditUnitDialog(this.pedido, this.comanda);
  @override
  _EditUnitDialog createState() => _EditUnitDialog();
}

class _EditUnitDialog extends State<EditUnitDialog> {
  int editValue = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar Pedido de ' + widget.pedido.produto.name),
      content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 42.0,
              icon: const Icon(Icons.remove_circle_sharp),
              onPressed: () {
                setState(() {
                  editValue -= 1;
                });
              },
            ),
            Container(
              width: 100.0,
              child: Text(
                (widget.pedido.unity + editValue).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  // height: 2.0,
                  color: getTextColor(),
                ),
              ),
            ),
            IconButton(
              iconSize: 42.0,
              icon: const Icon(Icons.add_circle_sharp),
              onPressed: () {
                setState(() {
                  editValue += 1;
                });
              },
            ),
          ]),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => {
            Navigator.pop(context),
            editValue = 0,
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
            widget.pedido.unity = widget.pedido.unity + editValue,
            if (widget.pedido.unity <= 0)
              widget.comanda.deletAsk(widget.pedido),
            Navigator.pop(context),
            editValue = 0,
          },
          child: Text(
            'Salvar Edição',
            style: TextStyle(backgroundColor: Colors.green),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ],
    );
  }

  Color getTextColor() {
    print(editValue);
    print(widget.pedido.unity);
    if ((widget.pedido.unity + editValue) > widget.pedido.unity) {
      return Colors.green;
    } else if ((widget.pedido.unity + editValue) < widget.pedido.unity) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }
}

Future<void> editUnitDialog(
    BuildContext context, Pedido pedido, Comanda comanda) async {
  return showDialog(
    context: context,
    builder: (context) {
      return EditUnitDialog(pedido, comanda);
    },
  );
}
