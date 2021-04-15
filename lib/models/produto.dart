import 'package:money2/money2.dart';

class Produto {
  final String id;
  final String name;
  final String _value;
  final String imgUrl;

  Produto(this.id, this.name, this._value, {this.imgUrl});

  String toString() =>
      'Produto id $id, name $name, value $_value, imgUrl $imgUrl';

  Money get value => Money.fromInt(
      int.parse(_value.replaceAll(",", "").replaceAll(".", "")),
      Currency.create('BRL', 2, symbol: r'R$ '));
}
