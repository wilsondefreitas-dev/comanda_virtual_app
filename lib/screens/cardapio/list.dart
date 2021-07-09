import 'package:comanda_virtual_app/models/cardapio.dart';
import 'package:comanda_virtual_app/screens/cardapio/set_unit_dialog.dart';
import 'package:flutter/material.dart';

class CardapioList extends StatefulWidget {
  final String curComandaID;

  CardapioList(this.curComandaID);
  @override
  _CardapioListState createState() => _CardapioListState();
}

class _CardapioListState extends State<CardapioList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: Cardapio.produtos.length,
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
                        child: Image.asset(Cardapio.produtos[index].imgUrl,
                            fit: BoxFit.cover),
                      ),
                      title: Text(Cardapio.produtos[index].name),
                      subtitle: Text('Valor: ' +
                          Cardapio.produtos[index].value.toString()),
                      trailing: Icon(Icons.add),
                      onTap: () => {
                        setUnitDialog(context, Cardapio.produtos[index],
                            widget.curComandaID)
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
