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
          title: Text('Cardápio RU'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
        ),
        drawer: MenuDrawer(),
        body: Container(child: MenuList()),
      ),
    );
  }
}
