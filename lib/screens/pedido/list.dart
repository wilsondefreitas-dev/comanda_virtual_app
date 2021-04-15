import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/models/pedido.dart';
import 'package:comanda_virtual_app/models/produto.dart';
import 'package:comanda_virtual_app/screens/cardapio/list.dart';
import 'package:comanda_virtual_app/screens/comanda/add_form.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: Text('Resumo de Pedidos'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey,
                      height: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            (r"Total: R$ " + comanda.getTotal().toString()),
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Text(comanda.name,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Text('RG: ' + comanda.userId),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: ElevatedButton(
                      child: Text(
                        "Fechar\nComanda",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => {
                        StAloneDB.deleteInList(widget.comandaID),
                        Navigator.pop(context)
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                          child: Image.asset(comanda.asks[index].produto.imgUrl,
                              fit: BoxFit.cover),
                        ),
                        title: Text(
                          comanda.asks[index].unity.toString() +
                              ' x  ' +
                              comanda.asks[index].produto.name,
                        ),
                        subtitle: Text('Total pedido: ' +
                            comanda.asks[index].getTotalValue()),
                        trailing: Icon(Icons.more_vert),
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
          // onPressed: ()
          // print(comanda.name);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddComanda()),
          // ).then((data) => addComanda(data));

          child: Icon(Icons.add),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ));
  }
}
