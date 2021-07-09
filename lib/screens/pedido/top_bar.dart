import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/screens/pedido/confirm_end.dart';
import 'package:comanda_virtual_app/standalone_db.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final Comanda comanda;

  TopBar(this.comanda);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    (r"Total: R$ " + widget.comanda.getTotal().toString()),
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(widget.comanda.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Text('RG: ' + widget.comanda.userId),
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
                confirmEndDialog(
                    context,
                    () => {
                          Navigator.popUntil(
                            context,
                            (route) => count++ == 2,
                          ),
                          StAloneDB.deleteInList(widget.comanda.id),
                        }).then((data) => setState(() {})),
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
