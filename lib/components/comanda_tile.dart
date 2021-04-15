import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/screens/pedido/list.dart';
import 'package:flutter/material.dart';

class ComandaTile extends StatefulWidget {
  final Comanda comanda;
  final Function widget;

  const ComandaTile(this.comanda, this.widget);

  @override
  _ComandaTileState createState() => _ComandaTileState();
}

class _ComandaTileState extends State<ComandaTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          getIDString(),
          style: TextStyle(fontSize: 32.0),
        ),
        title: Text(widget.comanda.name),
        subtitle: Text('RG: ' +
            widget.comanda.userId +
            ' | Valor Total: ' +
            widget.comanda.getTotal()),
        trailing: Icon(Icons.search),
        onTap: () => {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PedidoList(widget.comanda.id.toString())))
              .then((data) => {widget.widget(), setState(() {})})
        },
      ),
    );
  }

  String getIDString() {
    return (widget.comanda.id.toString().length > 1
        ? widget.comanda.id.toString()
        : '0' + widget.comanda.id.toString());
  }
}
