import 'package:comanda_virtual_app/models/produto.dart';

abstract class Cardapio {
  static final List<Produto> produtos = [
    //cervejas
    Produto('01', 'Skol', '4,00', imgUrl: 'images/skol.png'),
    Produto('02', 'Brahma', '4,00', imgUrl: 'images/skol.png'),
    Produto('03', 'Budweiser Gorda', '5,50', imgUrl: 'images/skol.png'),
    Produto('04', 'Budweiser Fina', '4,00', imgUrl: 'images/skol.png'),
    Produto('05', 'Heineken', '5,00', imgUrl: 'images/skol.png'),

    //vodka
    Produto('06', 'Smirnoff Dose', '10,00', imgUrl: 'images/skol.png'),
    Produto('08', 'Askov Dose', '8,00', imgUrl: 'images/skol.png'),

    //energético
    Produto('07', 'Red Bull', '10,00', imgUrl: 'images/skol.png'),
    Produto('09', 'Energético', '6,00', imgUrl: 'images/skol.png'),

    //outros
    Produto('10', 'Chevette', '10,00', imgUrl: 'images/skol.png'),
    Produto('11', 'Duelo', '5,00', imgUrl: 'images/skol.png'),
    Produto('12', 'Gelo e Coco', '2,00', imgUrl: 'images/skol.png'),
    Produto('13', 'Coca-cola Mini', '3,00', imgUrl: 'images/skol.png'),
    Produto('14', 'Água', '2,00', imgUrl: 'images/skol.png'),
  ];

  static getProductByID(String id) {
    Produto _founded;
    for (final value in produtos) {
      if (value.id == id) {
        _founded = value;
        break;
      }
    }
    return _founded;
  }
}
