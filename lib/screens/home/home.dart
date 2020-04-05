import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ru_unifei_app/models/menu.dart';
import 'package:ru_unifei_app/screens/home/menu_list.dart';
import 'package:ru_unifei_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Menu>>.value(
      value: DatabaseService().menus,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Cardápio RU - UNIFEI'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
        ),
        drawer: MenuDrawer(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: MenuList(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AwesomeDialog(context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            tittle: 'Evite filas',
            desc: 'Você pode comprar tickets para o almoço e jantar antecipadamente na cantina do RA',
            btnOkOnPress: () {}).show();
          },
          child: Icon(Icons.info_outline, color: Colors.red),
          backgroundColor: Colors.white,
        ),
        // Bottom navigation para contonar problema com o ad overlapping
        bottomNavigationBar: Container(
          height: 50.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
