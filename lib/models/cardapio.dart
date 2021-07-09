import 'package:comanda_virtual_app/models/produto.dart';

abstract class Cardapio {
  static final List<Produto> produtos = [
    //cervejas
    Produto('01', 'Skol', '5,00', imgUrl: 'images/skol.png'),
    Produto('02', 'Brahma Duplo Malte', '6,00', imgUrl: 'images/brahma.png'),
    Produto('03', 'Império', '5,00', imgUrl: 'images/imperio.png'),
    Produto('04', 'Budweiser', '7,00', imgUrl: 'images/budweiser.png'),
    Produto('05', 'Heineken', '8,00', imgUrl: 'images/heineken.png'),
    Produto('06', 'Heineken Garrafa', '10,00',
        imgUrl: 'images/heineken_garrafa.png'),

    //vodka
    Produto('07', 'Vodka Smirnoff', '10,00', imgUrl: 'images/smirnoff.png'),
    Produto('08', 'Vodka da Casa', '8,00', imgUrl: 'images/askov.png'),

    //whisky
    Produto('09', 'Whisky Passport', '10,00', imgUrl: 'images/passport.png'),
    Produto('10', 'Whisky White Horse', '8,00',
        imgUrl: 'images/white_horse.png'),

    //energético
    Produto('11', 'Energético da Casa', '10,00',
        imgUrl: 'images/energetico.png'),
    Produto('12', 'Red Bull', '6,00', imgUrl: 'images/redbull.png'),

    //outros
    Produto('13', 'Gelo de Coco', '10,00', imgUrl: 'images/gelo_de_coco.png'),
    Produto('14', 'Chevette', '5,00', imgUrl: 'images/chevette.png'),
    // Produto('15', 'Gelo e Coco', '2,00', imgUrl: 'images/skol.png'),
    // Produto('16', 'Coca-cola Mini', '3,00', imgUrl: 'images/skol.png'),
    // Produto('17', 'Água', '2,00', imgUrl: 'images/skol.png'),
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
