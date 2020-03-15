import 'package:ru_unifei_app/models/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference menuCollection = Firestore.instance.collection('cardapios');

  // menu list from snapshot
  List<Menu> _menuListFromSnapsot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data['element']['data']);
      var localOrderNumber;
      if (doc.data['element']['diaDaSemana'] == 'Segunda-feira') {
        localOrderNumber = 1;
      }
      if (doc.data['element']['diaDaSemana'] == 'Terça-feira') {
        localOrderNumber = 2;
      }
      if (doc.data['element']['diaDaSemana'] == 'Quarta-feira') {
        localOrderNumber = 3;
      }
      if (doc.data['element']['diaDaSemana'] == 'Quinta-feira') {
        localOrderNumber = 4;
      }
      if (doc.data['element']['diaDaSemana'] == 'Sexta-feira') {
        localOrderNumber = 5;
      }
      return Menu(
        data: doc.data['element']['data'] ?? '',
        diaDaSemana: doc.data['element']['diaDaSemana'] ?? '',
        pratoBase: doc.data['element']['pratoBase'] ?? '',
        pratoPrincipalAlmoco: doc.data['element']['pratoPrincipalAlmoco'] ?? '',
        pratoPrincipalJantar: doc.data['element']['pratoPrincipalJantar'] ?? '',
        vegetariana: doc.data['element']['vegetariana'] ?? '',
        guarnicao: doc.data['element']['guarnicao'] ?? '',
        saladas: doc.data['element']['saladas'] ?? '',
        sobremesa: doc.data['element']['sobremesa'] ?? '',
        bebida: doc.data['element']['bebida'] ?? '',
        molhos: doc.data['element']['molhos'] ?? '',
        orderNumber: localOrderNumber ?? 0,
      );
    }).toList();
  }

  // get menus stream
  Stream<List<Menu>> get menus {
    return menuCollection.snapshots()
      .map(_menuListFromSnapsot);
  }

}