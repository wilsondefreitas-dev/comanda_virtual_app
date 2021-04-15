import 'package:comanda_virtual_app/models/comanda.dart';

abstract class StAloneDB {
  static int id = 0;
  static List<Comanda> list = [];
  static List<Comanda> getList() => list;

  static void addList(Comanda comanda) {
    comanda.setID(++id);
    list.add(comanda);
  }

  static void deleteInList(comandaID) {
    list.removeWhere((data) => data.id == comandaID);
  }

  static getDataByID(id) {
    Comanda curComanda;

    list.map((comanda) {
      if (comanda.id == id) curComanda = comanda;
    }).toList();

    return curComanda;
  }

  static addNewAsk(id, newData) {
    getDataByID(id).addAsk(newData);
  }
}

/**
 * 
 * BUCKETS:
 *    - LIST
 *        - ADD
 *        - GETBYID
 * 
 */
