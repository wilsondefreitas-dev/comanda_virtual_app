import 'package:comanda_virtual_app/models/cardapio.dart';
import 'package:comanda_virtual_app/models/pedido.dart';
import 'package:comanda_virtual_app/models/produto.dart';
import 'package:money2/money2.dart';

class Comanda {
  final String name;
  final String userId;

  Comanda(this.name, this.userId);

  String id;
  List asks = []; //<Pedido>

  final List<Produto> produto = Cardapio.produtos;

  void addAsk(Pedido ask) {
    for (Pedido data in asks) {
      if (data.produto.id == ask.produto.id) {
        data.unity += ask.unity;
        return;
      }
    }

    asks.add(ask);
  }

  void setID(_id) {
    id = _id.toString();
  }

  String getTotal() {
    double total = 0.0;
    asks.map((pedido) {
      total += double.parse(pedido.getTotalValue().replaceAll(r'R$ ', ''));
    }).toList();

    String str = total.toString().replaceAll('.', ',');
    if (str.split(',')[1].length < 2) str = str + '0';

    return str;
  }
}
