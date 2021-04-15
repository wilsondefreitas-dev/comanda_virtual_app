import 'package:comanda_virtual_app/components/comanda_tile.dart';
import 'package:comanda_virtual_app/models/comanda.dart';
import 'package:comanda_virtual_app/standalone_db.dart';
import 'package:flutter/material.dart';

import 'add_form.dart';

class ComandaList extends StatefulWidget {
  final List<Comanda> list = StAloneDB.getList();
  @override
  _ComandaListState createState() => _ComandaListState();
}

class _ComandaListState extends State<ComandaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comandas Abertas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ComandaTile(widget.list[index], refresh);
        },
        itemCount: widget.list.length,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.black54,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddComanda()),
          ).then((data) => addComanda(data));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void addComanda(comanda) {
    if (comanda.name != null && comanda.userId != null)
      setState(() {
        StAloneDB.addList(comanda);
      });
  }

  void refresh() => setState(() {});
}
