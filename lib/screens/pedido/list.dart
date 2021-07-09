import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/screens/cardapio/list.dart';
import 'package:comanda_virtual_app/screens/pedido/edit_unit_dialog.dart';
import 'package:comanda_virtual_app/screens/pedido/top_bar.dart';
import 'package:comanda_virtual_app/standalone_db.dart';
import 'package:flutter/material.dart';

class PedidoList extends StatefulWidget {
  final String comandaID;

  PedidoList(this.comandaID);

  @override
  _PedidoListState createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  @override
  Widget build(BuildContext context) {
    final Comanda comanda = StAloneDB.getDataByID(widget.comandaID);
    if (comanda != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Resumo de Pedidos'),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              TopBar(comanda),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: comanda.asks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Image.asset(
                                comanda.asks[index].produto.imgUrl,
                                fit: BoxFit.cover),
                          ),
                          title: Text(
                            comanda.asks[index].unity.toString() +
                                ' x  ' +
                                comanda.asks[index].produto.name,
                          ),
                          subtitle: Text('Total pedido: ' +
                              comanda.asks[index].getTotalValue()),
                          trailing: Icon(Icons.edit),
                          onTap: () => {
                            editUnitDialog(
                              context,
                              comanda.asks[index],
                              comanda,
                            ).then((data) => setState(() {}))
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardapioList(widget.comandaID)),
              ).then((data) => {setState(() {})});
            },
            child: Icon(Icons.add),
          ));
    } else {
      return Container(
        child: Text(''),
      );
    }
  }
}
