import 'package:comanda_virtual_app/components/text_input.dart';
import 'package:comanda_virtual_app/models/cardapio.dart';
import 'package:comanda_virtual_app/models/pedido.dart';
import 'package:comanda_virtual_app/models/produto.dart';
import 'package:comanda_virtual_app/standalone_db.dart';
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
                        _displayTextInputDialog(context,
                            Cardapio.produtos[index], widget.curComandaID)
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

Future<void> _displayTextInputDialog(
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
          mask: 'rg',
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
              StAloneDB.addNewAsk(
                  curComandaID,
                  Pedido(Cardapio.getProductByID(product.id),
                      int.parse(_controllerUnity.text))),
              Navigator.popUntil(
                context,
                (route) => count++ == 2,
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
