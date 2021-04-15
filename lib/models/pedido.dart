import 'package:comanda_virtual_app/models/produto.dart';

class Pedido {
  final Produto produto;
  int unity;

  Pedido(this.produto, this.unity);

  String getTotalValue() {
    return (produto.value * unity).toString();
  }
}
